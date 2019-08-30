from ..helper.helper import json_response, check_parameter_table,check_parameter
from ..authener import controller as authener
from flask import request
from ..database import db,Request,Request_To,Request_Log,User
from ..helper import helper
from sqlalchemy.exc import IntegrityError
from sqlalchemy.sql.expression import or_,and_,func
import datetime
from ..app import app
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
sess = db.session

@authener.check_token("admin")
def getAllRequest():
  global sess
  try:
    request_info = sess.query(Request).filter(Request.inuse == True).all()
    request_list = []
    for req in request_info:
      req_dict = {}
      req_value = helper.serialize(req)
      req_dict = req_value
      req_user_log_info = sess.query(User.username,Request_Log.case_log,Request_Log.comment,Request.id).outerjoin(User,(Request.create_by == User.id)).outerjoin(Request_Log,(Request.id == Request_Log.id_request)).filter(and_(Request.inuse == True,Request.id == req_value['id'])).order_by((Request_Log.create_date).desc()).first()
      req_dict['create_by_username'] = req_user_log_info.username
      req_dict['comment'] = req_user_log_info.comment
      # req_dict['case_log'] = req_user_log_info.case_log
      if(req_user_log_info.case_log != 'APPROVE' and req_user_log_info.case_log != 'REJECT'):
        req_dict['case_log'] = 'NOT APPROVE'
      else:
        req_dict['case_log'] = req_user_log_info.case_log
      request_list.append(req_dict)
    return json_response({"requests": request_list}, 200)
  except Exception as e:
    print 'error api getAllRequest: ', e
    return json_response({"message": e.message}, 400)

@authener.check_token("user")
def getRequest(id_user):
  global sess
  try:
    request_info = sess.query(Request).filter(and_(Request.create_by == id_user,Request.inuse == True)).all()
    request_list = []
    for req in request_info:
      # req_value = helper.serialize(req)
      # request_list.append(req_value)
      req_dict = {}
      req_value = helper.serialize(req)
      req_dict = req_value
      req_log_info = sess.query(Request_Log.case_log,Request_Log.comment,Request.id).outerjoin(Request_Log,(Request.id == Request_Log.id_request)).filter(Request.id == req_value['id']).order_by((Request_Log.create_date).desc()).first()
      req_dict['comment'] = req_log_info.comment
      if(req_log_info.case_log != 'APPROVE' and req_log_info.case_log != 'REJECT'):
        req_dict['case_log'] = 'NOT APPROVE'
      else:
        req_dict['case_log'] = req_log_info.case_log
      request_list.append(req_dict)
    return json_response({"requests": request_list}, 200)
  except Exception as e:
    print 'error api getRequest for each user: ', e
    return json_response({"message": e.message}, 400)

@authener.check_token("user")
def createRequest():
  global sess
  data = request.json
  data_create = data['request_document']
  parameter_check = ["subject","main","create_by"]
  _,missing_key = check_parameter(data_create.keys(), parameter_check)
  if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
  for s in data_create.values():
    if helper.validator(str(s), ".*[;|'|(\")].*") == True: # has some special character
      return json_response({"message": "Has some special character in input data"},400)
  try:
    new_request = Request(
      subject = data_create.get("subject", None),
      main = data_create.get("main", None),
      create_by = data_create.get("create_by", None),
      create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
      inuse = True
    )
    sess.add(new_request)

    request_info = sess.query(Request).filter(Request.subject == data_create['subject']).order_by((Request.id).desc()).limit(1)
    for req in request_info:
      request_dict = helper.serialize(req)
      new_request_log = Request_Log(
        id_request = request_dict["id"],
        case_log = "CREATE",
        create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
        create_by = data_create["create_by"]
      )
      sess.add(new_request_log)
    sess.commit()
    return json_response({"message": "Create Complete", "status": 'success'},200)
  except Exception as e:
    print 'error create request: ', e
    sess.rollback()
    return json_response({"message": e.message},400)

@authener.check_token("user")
def editRequest():
  global sess
  data = request.json
  data_edit = data['request_document']
  parameter_check = ["id_request","subject","main","create_by"]
  _,missing_key = check_parameter(data_edit.keys(), parameter_check)
  if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
  for s in data_edit.values():
    if helper.validator(str(s), ".*[;|'|(\")].*") == True: # has some special character
      return json_response({"message": "Has some special character in input data"},400)
  try:
    update_request = Request.query.filter_by(id = data_edit["id_request"]).update(dict(subject = data_edit['subject'], main = data_edit['main']))
    new_request_log = Request_Log(
      id_request = data_edit["id_request"],
      case_log = "EDIT",
      create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
      create_by = data_edit["create_by"]
    )
    sess.add(new_request_log)
    sess.commit()
    return json_response({"message": "Edit Complete", "status": 'success'},200)
  except Exception as e:
    print 'error api edit request: ',e
    sess.rollback()
    return json_response({"message": e.message},400)

@authener.check_token("user")
def blockRequest(id_request,id_user,block):
  global sess
  try:
    if block == "true":
      update_request = Request.query.filter_by(id = id_request).update(dict(inuse = False))
      new_request_log = Request_Log(
        id_request = int(id_request),
        case_log = "BLOCK",
        create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
        create_by = id_user,
        comment = None
      )
      sess.add(new_request_log)
      sess.commit()
      return json_response({"message": "Block Complete", "status": 'success'},200)
    else:
      update_request = Request.query.filter_by(id = id_request).update(dict(inuse = True))
      new_request_log = Request_Log(
        id_request = int(id_request),
        case_log = "UNBLOCK",
        create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
        create_by = id_user,
        comment = None
      )
      sess.add(new_request_log)
      sess.commit()
      return json_response({"message": "Unblock Complete", "status": 'success'},200)
  except Exception as e:
    print 'error api block request: ',e
    sess.rollback()
    return json_response({"message": e.message},400)

@authener.check_token("admin")
def approveRequest(id_request):
  global sess
  data = request.json
  data_edit = data['request_document']
  parameter_check = ["case_log","comment","create_by"]
  _,missing_key = check_parameter(data_edit.keys(), parameter_check)
  if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
  for s in data_edit.values():
    if helper.validator(str(s), ".*[;|'|(\")].*") == True: # has some special character
      return json_response({"message": "Has some special character in input data"},400)
  try:
    new_request_log = Request_Log(
      id_request = id_request,
      case_log = data_edit["case_log"],
      create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
      create_by = data_edit["create_by"],
      comment = data_edit["comment"]
    )
    sess.add(new_request_log)
    sess.commit()
    return json_response({"message": "Aprrove Request Complete", "status": 'success'},200)
  except Exception as e:
    print 'error api approve request: ',e
    sess.rollback()
    return json_response({"message": e.message},400)