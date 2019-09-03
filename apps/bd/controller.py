from ..helper.helper import json_response, check_parameter_table,check_parameter
from ..authener import controller as authener
from flask import request
from ..database import db,BD,BD_Log
from ..helper import helper
from sqlalchemy.exc import IntegrityError
from sqlalchemy.sql.expression import or_,and_,func
import datetime
from ..app import app
sess = db.session
def root_endpoint():
    return json_response({"message": "department root endpoint"})

@authener.check_token("admin")
def getBD():
    global sess
    try:
        bd_info = sess.query(BD).all()
        bd_list = []
        for bd in bd_info:
            bd_value = helper.serialize(bd)
            bd_list.append(bd_value)
        return json_response({"bd": bd_list}, 200)
    except Exception as e:
        print 'error api getBD authen admin: ', e
        return json_response({"message": e.message}, 400)

@authener.check_token("admin")
def createBD():
    global sess
    data = request.json
    data_create = data['bd_document']
    parameter_check = ["name","type","ratio_engcost","create_by"]
    _,missing_key = check_parameter(data_create.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        check_bd_name = sess.query(BD).filter((BD.name == data_create['name'])).first()
        if check_bd_name is not None:
            return json_response({"message": "BD name is use by another"},400)

        new_bd = BD(
            name = data_create.get("name", None),
            type = data_create.get("type", None),
            ratio_engcost = data_create.get("ratio_engcost", None),
            create_by = data_create.get("create_by", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            inuse = True
        )
        sess.add(new_bd)

        bd_info = sess.query(BD).filter(and_(BD.name == data_create['name'],BD.inuse == True,BD.type == data_create['type'])).order_by((BD.id).desc()).limit(1)
        for bd in bd_info:
            bd_dict = helper.serialize(bd)
            new_bd_log = BD_Log(
                id_bd = bd_dict["id"],
                case_log = "CREATE",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create["create_by"]
            )
            sess.add(new_bd_log)
        sess.commit()
        return json_response({"message": "Create Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api create bd: ', e
        reason = e.message
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("admin")
def blockBD(id,block,user_id):
    global sess
    try:
        if block != 'false':
            update_bd = BD.query.filter_by(id =id).update(dict(inuse = False))
            new_bd_log = BD_Log(
                id_bd = id,
                case_log = "BLOCK",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = user_id
            )
            sess.add(new_bd_log)
            sess.commit()
            return json_response({"message": "Block Complete", "status": 'success'},200)
        else:
            update_bd = BD.query.filter_by(id =id).update(dict(inuse = True))
            new_bd_log = BD_Log(
                id_bd = id,
                case_log = "UNBLOCK",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = user_id
            )
            sess.add(new_bd_log)
            sess.commit()
            return json_response({"message": "Unblock Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api block BD: ',e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("admin")
def editBD():
    global sess
    data = request.json
    data_edit = data['bd_document']
    parameter_check = ["id","name","type","ratio_engcost","create_by"]
    _,missing_key = check_parameter(data_edit.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        # check_bd_name = sess.query(BD).filter((BD.name == data_edit['name'])).first()
        # if check_bd_name is not None:
        #     print check_bd_name
        #     return json_response({"message": "BD name is use by another"},400)
        # check nsme

        update_BD = BD.query.filter_by(id =data_edit["id"]).update(dict(name = data_edit['name'], type = data_edit['type'], ratio_engcost = data_edit['ratio_engcost']))
        new_bd_log = BD_Log(
            id_bd = data_edit["id"],
            case_log = "EDIT",
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            create_by = data_edit["create_by"]
        )
        sess.add(new_bd_log)
        sess.commit()
        return json_response({"message": "Edit Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api edit bd: ',e
        sess.rollback()
        return json_response({"message": e.message},400)
