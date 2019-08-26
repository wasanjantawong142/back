from ..helper.helper import json_response, check_parameter_table,check_parameter,createXlsx
from ..helper import helper
from flask import request, send_file
from ..database import db,Bom_Main,Bom_Log,Bom_Sale_Log,Bom_Solution_Log,Bom_Item,Bom_Item_Price,Bom_BD,User_Relation,User_Group_Relation,User_Group,BD,User
from sqlalchemy.exc import IntegrityError
from sqlalchemy.sql.expression import or_,and_,func
from ..authener import controller as authener
import datetime
from bson import json_util
import json
import os

sess = db.session

def report_admin():
    global sess
    report = []
    bom_main = sess.query(Bom_Main).all()
    for bom in bom_main:
        bom_dict = helper.serialize(bom)
        solution_log = sess.query(Bom_Solution_Log).filter((Bom_Solution_Log.id_bom == bom_dict['id'])).order_by((Bom_Solution_Log.id).desc()).limit(1)
        solution_dict = helper.serialize(solution_log[0])
        if solution_dict['case_log'] == 'APPROVE':
            sale_log = sess.query(Bom_Sale_Log).filter((Bom_Sale_Log.id_bom == bom_dict['id'])).order_by((Bom_Sale_Log.id).desc()).limit(1)
            sale_dict = helper.serialize(sale_log[0])
            bom_dict['id_log'] = sale_dict['id']
            bom_dict['case_log'] = sale_dict['case_log']
            bom_dict['log_date'] = sale_dict['create_date']
            bom_dict['log_by'] = sale_dict['create_by']
            bom_dict['log_type'] = 'sale'
        else:
            bom_dict['id_log'] = solution_dict['id']
            bom_dict['case_log'] = solution_dict['case_log']
            bom_dict['log_date'] = solution_dict['create_date']
            bom_dict['log_by'] = solution_dict['create_by']
            bom_dict['log_type'] = 'presale'
        report.append(bom_dict)
    return report

def reportpresale_presale(user_id):
    global sess
    report = []
    bom_main = sess.query(Bom_Main).filter((Bom_Main.presale_id.in_(user_id))).all()
    print 'bom all order'
    for bom in bom_main:
        bom_dict = helper.serialize(bom)
        solution_log = sess.query(Bom_Solution_Log).filter((Bom_Solution_Log.id_bom == bom_dict['id'])).order_by((Bom_Solution_Log.id).desc()).limit(1)
        solution_dict = helper.serialize(solution_log[0])
        if solution_dict['case_log'] == 'APPROVE':
            sale_log = sess.query(Bom_Sale_Log).filter((Bom_Sale_Log.id_bom == bom_dict['id'])).order_by((Bom_Sale_Log.id).desc()).limit(1)
            sale_dict = helper.serialize(sale_log[0])
            bom_dict['id_log'] = sale_dict['id']
            bom_dict['case_log'] = sale_dict['case_log']
            bom_dict['log_date'] = sale_dict['create_date']
            bom_dict['log_by'] = sale_dict['create_by']
            bom_dict['log_type'] = 'sale'
        else:
            bom_dict['id_log'] = solution_dict['id']
            bom_dict['case_log'] = solution_dict['case_log']
            bom_dict['log_date'] = solution_dict['create_date']
            bom_dict['log_by'] = solution_dict['create_by']
            bom_dict['log_type'] = 'presale'
        print 'report bom order', bom_dict
        report.append(bom_dict)
    return report

def reportsale_sale(user_id):
    global sess
    report = []
    # bom_main = sess.query(Bom_Main).filter(or_(Bom_Main.presale_id.in_(user_id),Bom_Main.create_by.in_(user_id))).all()
    bom_main = sess.query(Bom_Main).filter((Bom_Main.sale_id.in_(user_id))).all()
    print 'bom all order'
    for bom in bom_main:
        bom_dict = helper.serialize(bom)
        solution_log = sess.query(Bom_Solution_Log).filter((Bom_Solution_Log.id_bom == bom_dict['id'])).order_by((Bom_Solution_Log.id).desc()).limit(1)
        solution_dict = helper.serialize(solution_log[0])
        if solution_dict['case_log'] == 'APPROVE':
            sale_log = sess.query(Bom_Sale_Log).filter((Bom_Sale_Log.id_bom == bom_dict['id'])).order_by((Bom_Sale_Log.id).desc()).limit(1)
            sale_dict = helper.serialize(sale_log[0])
            bom_dict['id_log'] = sale_dict['id']
            bom_dict['case_log'] = sale_dict['case_log']
            bom_dict['log_date'] = sale_dict['create_date']
            bom_dict['log_by'] = sale_dict['create_by']
            bom_dict['log_type'] = 'sale'
        else:
            bom_dict['id_log'] = solution_dict['id']
            bom_dict['case_log'] = solution_dict['case_log']
            bom_dict['log_date'] = solution_dict['create_date']
            bom_dict['log_by'] = solution_dict['create_by']
            bom_dict['log_type'] = 'presale'
        print 'report bom order', bom_dict
        report.append(bom_dict)
    return report

def reportbd_bd(group_name):
    global sess
    report = []
    bom_id = sess.query(Bom_BD.id_bom).filter(and_(Bom_BD.bd_name == group_name,Bom_BD.inuse == True)).subquery('bom_id')
    bom_main = sess.query(Bom_Main).filter((Bom_Main.id.in_(bom_id))).all()
    for bom in bom_main:
        bom_dict = helper.serialize(bom)
        solution_log = sess.query(Bom_Solution_Log).filter((Bom_Solution_Log.id_bom == bom_dict['id'])).order_by((Bom_Solution_Log.id).desc()).limit(1)
        solution_dict = helper.serialize(solution_log[0])
        if solution_dict['case_log'] == 'APPROVE':
            sale_log = sess.query(Bom_Sale_Log).filter((Bom_Sale_Log.id_bom == bom_dict['id'])).order_by((Bom_Sale_Log.id).desc()).limit(1)
            sale_dict = helper.serialize(sale_log[0])
            bom_dict['id_log'] = sale_dict['id']
            bom_dict['case_log'] = sale_dict['case_log']
            bom_dict['log_date'] = sale_dict['create_date']
            bom_dict['log_by'] = sale_dict['create_by']
            bom_dict['log_type'] = 'sale'
        else:
            bom_dict['id_log'] = solution_dict['id']
            bom_dict['case_log'] = solution_dict['case_log']
            bom_dict['log_date'] = solution_dict['create_date']
            bom_dict['log_by'] = solution_dict['create_by']
            bom_dict['log_type'] = 'presale'
        bom_item = sess.query(Bom_Item,Bom_Item_Price).outerjoin(Bom_Item_Price,(Bom_Item.id == Bom_Item_Price.id_bom_item)).filter(and_(Bom_Item.inuse == True,Bom_Item_Price.inuse == True,Bom_Item.id_bom == bom_dict['id'], Bom_Item.bd_name == group_name)).all()
        bom_dict['total_actualcost_bd'] = 0
        bom_dict['total_engcost_bd'] = 0
        bom_dict['total_engcost_per_month_bd'] = 0
        for item in bom_item:
            item_dict = helper.serialize(item.Bom_Item)
            price_dict = helper.serialize(item.Bom_Item_Price)
            bom_dict['total_actualcost_bd'] = bom_dict['total_actualcost_bd'] + price_dict['item_actualcost']
            bom_dict['total_engcost_bd'] = bom_dict['total_engcost_bd'] + price_dict['item_engcost']
            bom_dict['total_engcost_per_month_bd'] = bom_dict['total_engcost_per_month_bd'] + price_dict['item_engcost_month']
        report.append(bom_dict)
    return report

def reportbd_admin():
    global sess
    report = []
    bom_id = sess.query(Bom_BD.id_bom).filter((Bom_BD.inuse == True)).subquery('bom_id')
    bom_main = sess.query(Bom_Main).filter((Bom_Main.id.in_(bom_id))).all()
    for bom in bom_main:
        bom_dict = helper.serialize(bom)
        solution_log = sess.query(Bom_Solution_Log).filter((Bom_Solution_Log.id_bom == bom_dict['id'])).order_by((Bom_Solution_Log.id).desc()).limit(1)
        solution_dict = helper.serialize(solution_log[0])
        if solution_dict['case_log'] == 'APPROVE':
            sale_log = sess.query(Bom_Sale_Log).filter((Bom_Sale_Log.id_bom == bom_dict['id'])).order_by((Bom_Sale_Log.id).desc()).limit(1)
            sale_dict = helper.serialize(sale_log[0])
            print 'log id sale: ',sale_dict['id']
            bom_dict['id_log'] = sale_dict['id']
            bom_dict['case_log'] = sale_dict['case_log']
            bom_dict['log_date'] = sale_dict['create_date']
            bom_dict['log_by'] = sale_dict['create_by']
            bom_dict['log_type'] = 'sale'
        else:
            print 'log id solution: ',solution_dict['id']
            bom_dict['id_log'] = solution_dict['id']
            bom_dict['case_log'] = solution_dict['case_log']
            bom_dict['log_date'] = solution_dict['create_date']
            bom_dict['log_by'] = solution_dict['create_by']
            bom_dict['log_type'] = 'presale'
        bom_item = sess.query(Bom_Item,Bom_Item_Price).outerjoin(Bom_Item_Price,(Bom_Item.id == Bom_Item_Price.id_bom_item)).filter(and_(Bom_Item.inuse == True,Bom_Item_Price.inuse == True,Bom_Item.id_bom == bom_dict['id'])).all()
        bom_dict['total_actualcost_bd'] = 0
        bom_dict['total_engcost_bd'] = 0
        bom_dict['total_engcost_per_month_bd'] = 0
        for item in bom_item:
            item_dict = helper.serialize(item.Bom_Item)
            price_dict = helper.serialize(item.Bom_Item_Price)
            bom_dict['total_actualcost_bd'] = bom_dict['total_actualcost_bd'] + price_dict['item_actualcost']
            bom_dict['total_engcost_bd'] = bom_dict['total_engcost_bd'] + price_dict['item_engcost']
            bom_dict['total_engcost_per_month_bd'] = bom_dict['total_engcost_per_month_bd'] + price_dict['item_engcost_month']
        report.append(bom_dict)
    return report

@authener.check_token("user")
def getReport(user_id,position,type_report):
    global sess
    try:
        if type_report == 'presale':
            if position == 'presale':
                id_in_order = []
                print 'user id ---------> ', user_id
                user_relation = sess.query(User_Relation.id_group,User_Relation.level,User.id).outerjoin(User,(User_Relation.id_user == User.id)).filter(User_Relation.id_user == user_id).first()
                id_in_order.append(user_id)
                user_id_l1 = sess.query(User_Relation,User).outerjoin(User,(User_Relation.id_user == User.id)).filter(and_(User_Relation.id_user != user_id,User_Relation.level < user_relation.level, User_Relation.id_group == user_relation.id_group, User_Relation.inuse == True)).all()
                for id in user_id_l1:
                    id_user = helper.serialize(id.User_Relation)
                    id_in_order.append(id_user['id_user'])
                group_relation = sess.query(User_Group_Relation).filter(and_(User_Group_Relation.id_group == user_relation.id_group, User_Group_Relation.inuse == True)).all()
                for group_id in group_relation:
                    id_group = helper.serialize(group_id)
                    user_id_l2 = sess.query(User_Relation,User).outerjoin(User,(User_Relation.id_user == User.id)).filter(and_(User_Relation.id_group == id_group['id_group_child'], User_Relation.inuse == True)).all()
                    for id in user_id_l2:
                        id_user = helper.serialize(id.User_Relation)
                        id_in_order.append(id_user['id_user'])
                report = reportpresale_presale(id_in_order)
                return json_response({"report": report},200)
            elif position == 'admin':
                report = report_admin()
                return json_response({"report": report},200)
            else:
                return json_response({"message": 'permision not macth'},400)
        elif type_report == 'sale':
            if position == 'sale':
                id_in_order = []
                user_relation = sess.query(User_Relation.id_group,User_Relation.level,User.id).outerjoin(User,(User_Relation.id_user == User.id)).filter(User_Relation.id_user == user_id).first()
                id_in_order.append(user_id)
                user_id_l1 = sess.query(User_Relation,User).outerjoin(User,(User_Relation.id_user == User.id)).filter(and_(User_Relation.id_user != user_id,User_Relation.level < user_relation.level, User_Relation.id_group == user_relation.id_group, User_Relation.inuse == True)).all()
                for id in user_id_l1:
                    id_user = helper.serialize(id.User_Relation)
                    id_in_order.append(id_user['id_user'])
                group_relation = sess.query(User_Group_Relation).filter(and_(User_Group_Relation.id_group == user_relation.id_group, User_Group_Relation.inuse == True)).all()
                for group_id in group_relation:
                    id_group = helper.serialize(group_id)
                    user_id_l2 = sess.query(User_Relation,User).outerjoin(User,(User_Relation.id_user == User.id)).filter(and_(User_Relation.id_group == id_group['id_group_child'], User_Relation.inuse == True)).all()
                    for id in user_id_l2:
                        id_user = helper.serialize(id.User_Relation)
                        id_in_order.append(id_user['id_user'])
                report = reportsale_sale(id_in_order)
                return json_response({"report": report},200)
            elif position == 'admin':
                report = report_admin()
                return json_response({"report": report},200)
            else:
                return json_response({"message": 'permision not macth'},400)
        elif type_report == 'bd':
            if position == 'admin' or position == 'cost':
                report = reportbd_admin()
                return json_response({"report": report},200)
            elif position == 'bd':
                group_name = []
                user_relation = sess.query(User_Relation.id_group).filter(User_Relation.id_user == user_id).first()
                group_name = sess.query(User_Group.name).filter(User_Group.id == user_relation.id_group).first()
                report = reportbd_bd(group_name.name)
                return json_response({"report": report},200)
            else:
                return json_response({"message": 'permision not macth'},400)
        elif type_report == 'all':
            report = report_admin()
            return json_response({"report": report},200)
        else:
            return json_response({"message": 'type report invalid'},400)
    except IntegrityError as e:
        print 'error api get report all bom', e
        return json_response({"message": e.message},400)

@authener.check_token("user")
def getHistory():
    global sess
    try:
        report = []
        bom_main = sess.query(Bom_Main).outerjoin(Bom_Log,(Bom_Main.id == Bom_Log.id_bom)).all()
        for bom in bom_main:
            bom_dict = helper.serialize(bom)
            bom_log = sess.query(Bom_Log).filter((Bom_Log.id_bom == bom_dict['id'])).order_by((Bom_Log.id).desc()).limit(1)
            for log in bom_log:
                log_dict = helper.serialize(log)
                bom_dict['last_modify'] = log_dict['create_date']
            report.append(bom_dict)
        return json_response({"report": report},200)
    except IntegrityError as e:
        print 'error api get report all bom', e
        return json_response({"message": e.message},400)
