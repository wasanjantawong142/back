# -*- coding: utf-8 -*-
from ..helper.helper import json_response, check_parameter_table,check_parameter,createXlsx
from ..helper import helper
from flask import request, send_file
from ..database import db,Bom_Main,Bom_Log,Bom_Sale_Log,Bom_Solution_Log,Request,Request_Log,Request_To,User,Bom_POC_Status
from sqlalchemy.exc import IntegrityError
from sqlalchemy.sql.expression import or_,and_,func
from ..authener import controller as authener
sess = db.session
import datetime
from bson import json_util
import json
import os
from ..helper.request_api import get_staff_intranet

# def getStaff(staff_id):
#     try:
#         result = get_staff_intranet(staff_id)
#         _,missing_key = check_parameter(result.keys(), ["message"])
#         if missing_key != []:
#             return json_response({"result": result}, 200)
#         return json_response({"message": result['message']}, 400)
#     except Exception as e:
#         print 'error api report user: ', e
#         return json_response({"message": e.message},400)


# @authener.check_token("user")
def createBom():
    global sess
    data = request.json
    data_create = data
    parameter_check = ["project_name","sale_code","presale_code","contract","total_sale_price","customer_name","customer_id","comment","id_poc"]
    _,missing_key = check_parameter(data_create.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        sale_profile = get_staff_intranet(data_create['sale_code'])
        _,missing_key = check_parameter(sale_profile.keys(), ["message"])
        if missing_key == []:
            return json_response({"message": sale_profile['message'], "status": 'fail'}, 400)
        presale_profile = get_staff_intranet(data_create['presale_code'])
        _,missing_key = check_parameter(presale_profile.keys(), ["message"])
        if missing_key == []:
            return json_response({"message": presale_profile['message'], "status": 'fail'}, 400)

        new_bom = Bom_Main(
            project_name = data_create.get("project_name", None),
            customer_id = data_create.get("customer_id", None),
            customer_name = data_create.get("customer_name", None),
            sale_id = sale_profile['employee_detail'][0]['code'],
            sale_name = sale_profile['employee_detail'][0]['thainame'] + ' ' + sale_profile['employee_detail'][0]['thlastname'],
            sale_tel = sale_profile['employee_detail'][0]['phonenumber'],
            presale_id =  presale_profile['employee_detail'][0]['code'],
            presale_name = presale_profile['employee_detail'][0]['thainame'] + ' ' + presale_profile['employee_detail'][0]['thlastname'],
            presale_tel = presale_profile['employee_detail'][0]['phonenumber'],
            contract = data_create.get("contract", None),
            total_sale_price = data_create.get("total_sale_price", None),
            total_actualcost = 0,
            total_engcost = 0,
            total_engcost_per_month = 0,
            sale_factor = 0,
            create_by = data_create.get("sale_code", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            version = '1.01',
            inuse = True,
            ref_type = 'POC',
            ref_id = data_create['id_poc']
        )
        sess.add(new_bom)
        bom_id = sess.query(Bom_Main).filter((Bom_Main.project_name==data_create["project_name"])).order_by((Bom_Main.id).desc()).limit(1)
        id_bom = []
        for id in bom_id:
            bom_dict = helper.serialize(id)
            id_bom.append(bom_dict)
        if id_bom != None:
            new_bom_poc_status = Bom_POC_Status(
                id_bom = id_bom[0]["id"],
                status = False,
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                modify_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7))
            )
            sess.add(new_bom_poc_status)

            new_bom_log = Bom_Log(
                id_bom = id_bom[0]["id"],
                case_log = "CREATE",
                version = '1.01',
                data_change = '',
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create['sale_code'],
                remark = data_create['comment']
            )
            sess.add(new_bom_log)

            new_bom_sale_log = Bom_Sale_Log(
                id_bom = id_bom[0]["id"],
                case_log = "WAITING",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create['sale_code']
            )
            sess.add(new_bom_sale_log)

            new_bom_solution_log = Bom_Solution_Log(
                id_bom = id_bom[0]["id"],
                case_log = "WAITING",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create['sale_code']
            )
            sess.add(new_bom_solution_log)

            new_request = Request(
                subject = 'คำร้อง ออกแบบ Solution สำหรับ POC (BOM ID : '+ id_bom[0]["id"] +')',
                main = 'เพิ่มข้อมูล Solution ในเอกสาร BOM เลขที่ ' + id_bom[0]["id"] + 'โดยมีรายละเอียดดังนี้' + data_create['comment'],
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create['sale_code']
            )
            sess.add(new_request)

            request = sess.query(Request).filter((Request.create_by==data_create["sale_code"])).order_by((Request.id).desc()).limit(1)
            id_request = {}
            for id in request:
                id_request = helper.serialize(id)

            new_request_to = Request_To(
                id_request = id_request['id'],
                request_to = data_create['presale_code']
            )
            sess.add(new_request_to)

            new_request_log = Request_Log(
                id_request = id_request['id'],
                case_log = 'CREATE',
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create['sale_code']
            )
            sess.add(new_request_log)

            sess.commit()
            return json_response({"message": "Create Complete", "status": 'success'},200)
        else:
            sess.rollback()
            return json_response({"message": "can't get bom id", "status": 'fail'},400)
    except Exception as e:
        print 'error api create bom open api: ' ,e
        sess.rollback()
        return json_response({"message": 'fuction error', "status": 'fail'},400)

def statusBom():
    global sess
    data = request.json
    parameter_check = ["lead_sale_code","sale_code","status","id_poc","id_bom","comment"]
    _,missing_key = check_parameter(data.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        bom_id = sess.query(Bom_Main).filter(and_(Bom_Main.ref_type == 'POC', Bom_Main.ref_id == data['id_poc'])).all()
        id_bom = []
        for id in bom_id:
            bom_dict = helper.serialize(id)
            id_bom.append(bom_dict)
        if id_bom != None:
                if data['status'] == 'APPROVE':
                    new_bom_sale_log = Bom_Sale_Log(
                        id_bom = id_bom[0]["id"],
                        case_log = "APPROVE",
                        create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                        create_by = data['sale_code']
                    )
                    sess.add(new_bom_sale_log)
                    sess.commit()
                    return json_response({"message": "Change Status Complete", "status": 'success'},200)
                    # new_request = Request(
                    #     subject = 'คำร้อง ออกแบบ Solution สำหรับ POC (BOM ID : '+ id_bom[0]["id"] +')',
                    #     main = 'เพิ่มข้อมูล Solution ในเอกสาร BOM เลขที่ ' + id_bom[0]["id"] + 'โดยมีรายละเอียดดังนี้' + data_create['comment'],
                    #     create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    #     create_by = data_create['sale_code']
                    # )
                    # sess.add(new_request)
                    #
                    # request = sess.query(Request).filter((Request.create_by==data_create["sale_code"])).order_by((Request.id).desc()).limit(1)
                    # id_request = {}
                    # for id in request:
                    #     id_request = helper.serialize(id)
                    #
                    # new_request_to = Request_To(
                    #     id_request = id_request['id'],
                    #     request_to = data_create['presale_code']
                    # )
                    # sess.add(new_request_to)
                    #
                    # new_request_log = Request_Log(
                    #     id_request = id_request['id'],
                    #     case_log = 'CREATE',
                    #     create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    #     create_by = data_create['sale_code']
                    # )
                    # sess.add(new_request_log)
                elif data['status'] == 'REJECT':
                    new_bom_sale_log = Bom_Sale_Log(
                        id_bom = id_bom[0]["id"],
                        case_log = "REJECT",
                        create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                        create_by = data['sale_code']
                    )
                    sess.add(new_bom_sale_log)
                    sess.commit()
                    return json_response({"message": "Change Status Complete", "status": 'success'},200)
                else:
                    return json_response({"message" : "Status Invalid", "status": 'fail'},400)
        else:
            sess.rollback()
            return json_response({"message": "can't get bom id", "status": 'fail'},400)
    except Exception as e:
        print 'error api edit bom open api: ' ,e
        sess.rollback()
        return json_response({"message": 'function error', "status": 'fail'},400)

def getPresale():
    global sess
    try:
        presale_all = sess.query(User).filter(or_(User.position == 'presale', User.position == 'leadpresale', User.position == 'admin')).all()
        presale = []
        for id in presale_all:
            presale_data = {}
            presale_dict = helper.serialize(id)
            presale_profile = get_staff_intranet(presale_dict['id'])
            _,missing_key = check_parameter(presale_profile.keys(), ["message"])
            if missing_key != []:
                print presale_profile
                presale_data['first_name'] = presale_profile['employee_detail'][0]['thainame']
                presale_data['last_name'] = presale_profile['employee_detail'][0]['thlastname']
                presale_data['staff_id'] = presale_profile['employee_detail'][0]['code']
                presale_data['phone'] = presale_profile['employee_detail'][0]['phonenumber']
                presale_data['email'] = presale_profile['employee_detail'][0]['email']
                presale_data['position'] = presale_profile['employee_detail'][0]['positionname']
                presale.append(presale_data)
        return json_response({"bom_presale": presale},200)
    except Exception as e:
        print 'error get presale open api: ', e
        return json_response({"message": "can't get presale id", "status": 'fail'},400)
