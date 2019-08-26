# -*- coding: utf-8 -*-
import json
import requests
from oneplatform.oneid import OneIDApi

one_id_api = OneIDApi(
    client_id="53",
    client_secret="sKxqf5hry5DJcLps0TueFs9QAxKG7oAbFW7u473r",
    ref_code="POz6Ci"
)

def check_auth_oneid(body_request):
    data_gettoken = {}
    try:
        print 'begin auth one id'
        user = body_request["username"].split('@')
        # user[0] = user[0] + '@one.th'
        url_gettoken = "https://one.th/api/oauth/getpwd"
        payload_gettoken = {
            "grant_type":"password",
            "client_id":"53",
            "client_secret":"sKxqf5hry5DJcLps0TueFs9QAxKG7oAbFW7u473r",
            "username": user[0],
            "password":body_request["password"]
        }
        headers_gettoken = {
            'Content-Type': "application/json",
            'Cache-Control': "no-cache"
            }
        response_gettoken = requests.request("POST", url_gettoken, json=payload_gettoken, headers=headers_gettoken, verify=False)#, timeout = 5
        data_gettoken = json.loads(response_gettoken.content)
        print 'finish auth one id'
        return data_gettoken
    except Exception as e:
        print "auth one id error: " ,e
        data_gettoken['result'] = "Fail"
        data_gettoken['errorMessage'] = e.message
        return data_gettoken

def get_account_oneid(body_request):
    url_getuser = "https://one.th/api/account"
    payload_getuser = ""
    headers_getuser = {
        'Authorization': body_request["token_type"] + " " + body_request["access_token"],
        'Cache-Control': "no-cache",
        }
    response_getuser = requests.request("GET", url_getuser, data=payload_getuser, headers=headers_getuser)
    data_getuser = json.loads(response_getuser.content)
    return data_getuser

def login_one_id(body_request):
    result = {}
    result['result'] = 'Fail'
    try:
        user = body_request["username"].split('@')
        user[0] = user[0] + '@one.th'
        result = one_id_api.login(user[0], body_request["password"])
        return result
    except Exception as e:
        print("Login failed: ", e)
        result['errorMessage'] = e[0]
        return result

def profile_one_id(access_token):
    result = {}
    try:
        result = one_id_api.get_profile(access_token)
        return result
    except Exception as e:
        print 'get profile fail: ', e
        return result

def get_staff_intranet (staff_id) :
    try:
        url = "http://hr.devops.inet.co.th:9999/api/v1/employee/"+staff_id
        headers = {
        'Authorization': "1eb57ea4-db5d-46dc-b806-ef88b6c92def"
        }
        response = requests.request("GET", url, headers=headers)
        result = json.loads(response.content)
        return result
    except Exception as e:
        print "intranet  error: " ,e
        result['message'] = e.message
        return result

def poc_fuction (bom):
    data = {}
    try:
        url_gettoken = "https://one.th/api/oauth/getpwd"
        payload = {
            "bom_data": bom
        }
        headers = {
            'Content-Type': "application/json",
            'Cache-Control': "no-cache"
            }
        response = requests.request("POST", url_gettoken, json=payload, headers=headers, verify=False)#, timeout = 5
        data= json.loads(response.content)
        return data_gettoken
    except Exception as e:
        print "auth one id error: " ,e
        data_gettoken['result'] = "Fail"
        data_gettoken['errorMessage'] = e.message
        return data_gettoken
