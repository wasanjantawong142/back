# -*- coding: utf-8 -*
from flask import request
from ..helper.helper import check_parameter_table,json_response,encryption_password,check_parameter,check_validator
from ..helper import helper
from ..database import User,User_Group,User_Relation,User_Relation_Log
from ..authener import controller as authener
from sqlalchemy.exc import IntegrityError
from sqlalchemy.sql.expression import or_,and_,func
from ..database import db
from ..database import Request
from ..database import Request_Log
import datetime
from ..helper.request_api import get_staff_intranet
import json
import requests
from oneplatform.oneid import OneIDApi

one_id = {
    "client_id": "53",
    "client_secret": "sKxqf5hry5DJcLps0TueFs9QAxKG7oAbFW7u473r",
    "ref_code": "POz6Ci"
}

sess = db.session


def createUser():
    global sess
    data = request.json
    data_create = data['data_create']
    parameter_check = [
        "account_title_th",
        "first_name_th",
        "last_name_th",
        "account_title_eng",
        "first_name_eng",
        "last_name_eng",
        "id_card_type",
        "id_card_type",
        "id_card_num",
        "email",
        "mobile_no",
        "birth_date",
        "username",
        "password",
        "position",
    ]


    _,missing_key = check_parameter(data_create.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)

    status_check_valid, msg_valid = check_validator(data_create)
    if(not status_check_valid): return json_response({"message": msg_valid}, 400)

    data = {}
    try:
        url = "https://one.th/api/register_api"
        payload = data_create
        # payload.pop("position")
        data_create["role"] = "user"
        payload['ref_code'] = one_id['ref_code']
        payload['clientId'] = one_id['client_id']
        payload['secretKey'] = one_id['client_secret']

        headers = {
            'Content-Type': "application/json",
            'Cache-Control': "no-cache",
        }
        response = requests.request("POST", url, json=payload, headers=headers, verify=False)#, timeout = 5
        data = json.loads(response.content)
        
        # print "----------------- data data ----------------"
        # print data

        if(data['result'] != 'Fail'):
            return_data = data['data']
            new_request = Request(
                subject = "สมาชิกใหม่",
                main = "accountID: "+ str(return_data['accountID']) + ", email: " + str(return_data['email']) + ", username: " + data_create['username'] + ", role: " + data_create['role'] + ", tel: " + data_create['mobile_no'] + ", position: " + data_create['position'],
                create_by = "0",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                # inuse = True
            )
            sess.add(new_request)

            request_info = sess.query(Request).filter(Request.subject == "สมาชิกใหม่").order_by((Request.id).desc()).limit(1)
            for req in request_info:
                request_dict = helper.serialize(req)
                new_request_log = Request_Log(
                    id_request = request_dict["id"],
                    case_log = "CREATE",
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = "0"
                )

            sess.add(new_request_log)
            sess.commit()
        return json_response(data, 200)
    except Exception as e:
        print "register eror: " ,e
        sess.rollback()
        return json_response({"message": e.message},400)