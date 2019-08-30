# -*- coding: utf-8 -*
from flask import request
from ..helper.helper import check_parameter_table,json_response,encryption_password,check_parameter,check_validator
from ..helper import helper
from ..database import User_Group
from ..authener import controller as authener
from sqlalchemy.sql.expression import or_,and_,func
from ..database import db
import datetime
from validator import Required, Not, Truthy, Blank, Range, Equals, In, validate
sess = db.session
# import re

# def validSpecialCharacters(word):
#     if re.match("^[a-zA-Z0-9_]*$", word):
#         return "Valid"
#     else:
#         return "Invalid"

        

@authener.check_token("admin")
def getAllGroup():
    global sess
    try:
        group_info = sess.query(User_Group).all()
        group_list = []
        for group in group_info:
            group_value = helper.serialize(group)
            group_list.append(group_value)
        return json_response({"group": group_list}, 200)
    except Exception as e:
        print 'error api get all group user: ', e
        return json_response({"message": e.message}, 400)
        
def getAllGroupPosition():
    global sess
    try:
        group_info = sess.query(User_Group).filter(User_Group.inuse == True)
        group_info_position = sess.query(User_Group).filter(User_Group.inuse == True).group_by(User_Group.position_type)
        group_dict = {}
        for group_position in group_info_position:
            group_list = []
            

            for group in group_info:
                if(group_position.position_type == group.position_type):
                    group_list.append(group.name)
            group_dict[group_position.position_type] = group_list
        print "-------------------------- position_list ---------------"
        print group_dict
        return json_response({"group_position_list": group_dict} , 200)
    except Exception as e:
        print 'error api get all group user: ', e
        return json_response({"message": e.message}, 400)

@authener.check_token("admin")
def createGroup():
    global sess
    data = request.json
    data_create = data['data_create']
    parameter_check = ["name","position_type","create_by"]
    _,missing_key = check_parameter(data_create.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    
    rules = {
        "name": [Required, Truthy()],
        "position_type": [Required, Truthy()],
        "create_by": [Required, Truthy()]
    }

    valid_rules = validate(rules, data_create)
    if(valid_rules.valid == False): return json_response({"message": valid_rules.errors}, 400)
    
    status_check_valid, msg_valid = check_validator(data_create)
    if(not status_check_valid): return json_response({"message": msg_valid}, 400)

    try:
        user_info = sess.query(User_Group).filter((User_Group.name == data_create['name'])).first()
        if user_info is not None:
            return json_response({"message": "user group is in database", "status": 'fail'},400)
        new_group_user = User_Group(
            name  = data_create.get("name", None),
            position_type = data_create.get("position_type", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            create_by = data_create.get("create_by", None),
            inuse = True
        )
        sess.add(new_group_user)
        sess.commit()
        return json_response({"message": "Create Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api create group user: ',e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("admin")
def editGroup():
    global sess
    data = request.json
    data_edit = data['data_edit']
    parameter_check = ["id", "name","position_type","create_by"]
    _,missing_key = check_parameter(data_edit.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)

    rules = {
        "id": [Required, Truthy()],
        "name": [Required, Truthy()],
        "position_type": [Required, Truthy()],
        "create_by": [Required, Truthy()]
    }

    valid_rules = validate(rules, data_edit)
    if(valid_rules.valid == False): return json_response({"message": valid_rules.errors}, 400)

    status_check_valid, msg_valid = check_validator(data_edit)
    if(not status_check_valid): return json_response({"message": msg_valid}, 400)

    try:

        update_group = User_Group.query.filter_by(id = data_edit["id"]).update(dict(name = data_edit['name'], position_type= data_edit['position_type'], create_by = data_edit['create_by']))
        if(update_group): 
            sess.commit()
            return json_response({"message": "Edit Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api edit group user: ',e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("admin")
def getGroup(group_id):
    global sess
    try:
        group_result = sess.query(User_Group).filter(and_(User_Group.id == group_id,User_Group.inuse == True)).all()
        print "------------ group_result ---------"
        group_list = []
        for group in group_result:
            data = {}		
            data['id'] = group.id
            data['name'] = group.name
            data['position_type'] = group.position_type	
            data['create_date'] = group.create_date
            data['create_by'] = group.create_by
            group_list.append(data)
        print group_list
        if(group_list): 
            return json_response({"group": group_list}, 200)
    except Exception as e:
        print 'error api get group user: ',e
        return json_response({"message": e.message},400)
        
@authener.check_token("admin")
def delGroup(group_id, block):
    global sess
    try:
        if block != 'false':
            update_group = User_Group.query.filter_by(id = group_id).update(dict(inuse = False))
            sess.commit()
            return json_response({"message": "Block Complete", "status": 'success'},200)
        else:
            update_group = User_Group.query.filter_by(id = group_id).update(dict(inuse = True))
            sess.commit()
            return json_response({"message": "Unblock Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api block BD: ',e
        sess.rollback()
        return json_response({"message": e.message},400)

