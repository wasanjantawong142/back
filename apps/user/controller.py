# -*- coding: utf-8 -*
from flask import request
from ..helper.helper import check_parameter_table,json_response,encryption_password,check_parameter
from ..helper import helper
from ..database import User,User_Group,User_Relation,User_Relation_Log
from ..authener import controller as authener
from sqlalchemy.exc import IntegrityError
from sqlalchemy.sql.expression import or_,and_,func
from ..database import db
import datetime
from ..helper.request_api import get_staff_intranet

sess = db.session

@authener.check_token("admin")
def getAllUser():
    global sess
    try:
        user_info = sess.query(User).all()
        # print "----------- user_info ------------"
        # print user_info
        user_list = []
        for user in user_info:
            user_dict = {}
            user_value = helper.serialize(user)
            user_dict = user_value
            user_group_info = sess.query(User_Relation.level,User_Group.name,User_Group.id).outerjoin(User_Group,(User_Relation.id_group == User_Group.id)).filter(and_(User_Relation.id_user == user_value['id'],User_Relation.inuse == True )).first()
            user_dict['group_name'] = user_group_info.name
            user_dict['group_id'] = user_group_info.id
            user_dict['user_level'] = user_group_info.level
            user_list.append(user_dict)
            # print "----------------------------------------------- user_list -------------------"
            # print user_dict

        print "----------------------------------------------- end_list -------------------"
        print user_list
        # print user_list
        return json_response({"user": user_list}, 200)
    except Exception as e:
        print 'error api report user: ', e
        return json_response({"message": e.message},400)

@authener.check_token("admin")
def createUser():
    global sess
    data = request.json
    data_create = data['data_create']
    parameter_check = ["name","role","level","tel","position","group","create_by"]
    _,missing_key = check_parameter(data_create.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        user_info = sess.query(User).filter((User.username == data_create['name'])).first()
        if user_info is not None:
            return json_response({"message": "user is in database", "status": 'fail'},400)
        new_user = User(
            id = data_create.get("user_code", None),
            username = data_create.get("name", None),
            tel = data_create.get("tel", None),
            role = data_create.get("role", None),
            position = data_create.get("position", None),
            create_by = data_create.get("create_by", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7))
        )
        sess.add(new_user)

        user_id = sess.query(User.id).filter((User.username == data_create['name'])).first()
        new_relation = User_Relation(
            id_user = user_id.id,
            id_group = data_create['group'],
            level = data_create['level'],
            create_by = data_create.get("create_by", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            inuse = True
        )
        sess.add(new_relation)

        relation_id = sess.query(User_Relation.id).filter(and_(User_Relation.id_user == user_id.id, User_Relation.inuse == True)).first()
        new_relation_log = User_Relation_Log(
            id_relation = relation_id.id,
            case_log = 'CREATE',
            create_by = data_create.get("create_by", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
        )
        sess.add(new_relation_log)

        sess.commit()
        return json_response({"message": "Create Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api create user: ',e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("admin")
def editUser():
    global sess
    data = request.json
    data_edit = data['data_edit']
    print data_edit
    parameter_check = ["id","name","role","tel","level","position","group","create_by"]
    _,missing_key = check_parameter(data_edit.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        update_user = User.query.filter_by(id = data_edit["id"]).update(dict(username = data_edit['name'], tel= data_edit['tel'], role = data_edit['role'], position = data_edit['position']))
        update_user = User_Relation.query.filter_by(id_user = data_edit["id"]).update(dict(inuse = False))
        new_relation = User_Relation(
            id_user = data_edit["id"],
            id_group = data_edit['group'],
            level = data_edit['level'],
            create_by = data_edit.get("create_by", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            inuse = True
        )
        sess.add(new_relation)

        relation_id = sess.query(User_Relation.id).filter(and_(User_Relation.id_user == data_edit['id'], User_Relation.inuse == True)).first()
        new_relation_log = User_Relation_Log(
            id_relation = relation_id.id,
            case_log = 'EDIT',
            create_by = data_edit.get("create_by", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7))
        )
        sess.add(new_relation_log)
        print "----------------------------------------"
        sess.commit()
        return json_response({"message": "Edit Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api edit user: ',e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("user")
def getStaff(staff_id):
    try:
        result = get_staff_intranet(staff_id)
        _,missing_key = check_parameter(result.keys(), ["message"])
        if missing_key != []:
            return json_response({"result": result['employee_detail']}, 200)
        return json_response({"message": result['message']}, 400)
    except Exception as e:
        print 'error api report user: ', e
        return json_response({"message": e.message},400)
