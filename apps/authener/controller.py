# -*- coding: utf-8 -*-
from ..helper.helper import json_response, check_parameter, validator, check_parameter_table, check_ticket
from flask import request
#from ..database import Table1, Table2, db
from ..helper import helper
from ..helper.request_api import check_auth_oneid,get_account_oneid,login_one_id,profile_one_id
from ..database import db,cache,User,User_Group,User_Group_Relation,User_Relation
from sqlalchemy.sql.expression import or_,and_,func
from functools import wraps
#from werkzeug.contrib.cache import SimpleCache
import uuid
from Crypto.PublicKey import RSA

import datetime
import base64
import time
import re
import json

sess = db.session

SESSION_TIME = 720  # expried token every 60 min

# AUTO_EXPAND_TIME = 5  # change token when last 10 min
ACCESS_EXPIRE_TIME = 60
REFRESH_EXPIRE_TIME = 720

def generate_RSA(bits=2048):
    new_key = RSA.generate(bits, e=65537)
    public_key = new_key.publickey().exportKey("PEM")
    private_key = new_key.exportKey("PEM")
    return private_key, public_key


private_key, public_key = generate_RSA()
#cache = SimpleCache(default_timeout=100)  # generate new token every 10 s

def check_ticket(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        data = request.json
        if data == None:
            return json_response({"message": "invalid input"},400)
        valid, missing_key = helper.check_parameter(data.keys(), ["username", "state", "password"])
        print 'valid',valid
        if valid:
            ticket_key = data["username"] + ":" + data["state"] + ":s"
            ticket = cache.get(ticket_key)
            if ticket is not None:
                #  print cache.get(ticket_key)
                cache.delete(ticket_key)
                return f(*args, **kwargs)
            else:
                return json_response({"message": "Not found Ticket / Ticket expired."}, 400)
        else:
            return json_response({"message": "Missing parameters: " + ",".join(missing_key)}, 400)

    return decorated_function

    # return decorator

def check_token(access_level):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            #data = request.json
            # print 'check token'
            access_token = request.headers.get('Authorization')
            print "request url:" + request.url
            if access_token is not None:
                cache_access_token = cache.get("access_token:" + access_token)
                if cache_access_token is None:
                    return json_response({"message": "Unauthorization."}, 401)
                else:
                    print 'check_token: access still exist in memory.'
                    token_data = decryption_message(access_token)
                    # print token_data
                    if len(token_data) > 0:
                        # print 'access_token decypt----------> ', token_data
                        if token_data['type'] == "access":
                            if access_level == "admin" :
                                if token_data['role'] != "admin":
                                    return json_response({"message": "Permission Deny."}, 403)
                            # aaa = f(*args, **kwargs)
                            # print 'finish check token -------->', aaa
                            return f(*args, **kwargs)
                        else:
                            return json_response({"message": "Invalid Token."}, 401)
                    else:
                        return json_response({"message": "Invalid Token."}, 401)
            else:
                return json_response({"message": "missing headers: Authorization"}, 400)
        return decorated_function
    return decorator

def encryption_message(tokenclaim):
    public_key_object = RSA.importKey(public_key)
    random_phrase = "M"
    encrypted_message = public_key_object.encrypt(json.dumps(tokenclaim).replace('\'', '"'), random_phrase)[0]
    # use base64 for save encrypted_message in database without problems with encoding
    return base64.b64encode(encrypted_message)

def decryption_message(encrypted_message):
    encrypted_message = base64.b64decode(encrypted_message)
    private_key_object = RSA.importKey(private_key)
    decrypted_message = private_key_object.decrypt(encrypted_message)
    result = {}
    try:
        result = json.loads(decrypted_message)
        return result
    except:
        return result

def generate_token(user_id,username,role,state,access_token_one,refresh_token_one,fname,lname):
    issue = time.time()
    #access_expire = issue+datetime.timedelta(minutes=ACCESS_EXPIRE_TIME)
    access_expire = str(issue + (ACCESS_EXPIRE_TIME *60))
    access_tokenclaims = {"user_id": user_id,
                   "username": username,
                   # "access_token_one": access_token_one,
                   # "refresh_token_one": refresh_token_one,
                   "fname": fname,
                   "lname": lname,
                   "issue_at" : issue,
                   "expire_at": access_expire,
                    "role": role,
                   "state": state,
                    "type": "access"}
    access_token = encryption_message(access_tokenclaims)
    refresh_expire = str(issue +(REFRESH_EXPIRE_TIME *60))
    refresh_tokenclaims = {"user_id": user_id,
                   "username": username,
                   # "access_token_one": access_token_one,
                   # "refresh_token_one": refresh_token_one,
                   "fname": fname,
                   "lname": lname,
                   "issue_at": issue,
                   "expire_at": refresh_expire,
                   "role": role,
                   "state": state,
                    "type": "refresh"}
    refresh_token = encryption_message(refresh_tokenclaims)
    refresh_key = "refresh_token:" + str(refresh_token)
    access_key = "access_token:" + str(access_token)
    access_value =   str(user_id) + ":" + role + ":" + str(refresh_token)
    cache.setex(refresh_key, 60* REFRESH_EXPIRE_TIME, access_token)
    cache.setex(access_key, 60* ACCESS_EXPIRE_TIME, access_value)
    return access_token,refresh_token,access_expire

def apiGenerateState(username=None):
    start_time = time.time()
    if username is not None:
        state = uuid.uuid4().hex
        ticket_key = username + ":" + state + ":s"
        cache.setex(ticket_key, 60, state)
        elip_time = time.time() - start_time
        print 'time =' + str(elip_time)
        return json_response({"state": state}, 200)

    else:
        elip_time = time.time() - start_time
        print 'time =' + str(elip_time)
        return json_response({"message": "no username"}, 400)

def validator(text, pattern):
    # Compile request pattern into regular expression
    pattern_compiled = re.compile(pattern)
    return (True if pattern_compiled.match(text) != None else False)

@check_ticket
def apiLogin():
    global sess
    start_time = time.time()
    pass_pattern = "^[A-Za-z\d@$!%*?&]{7,20}$"
    data = request.json
    try:
        _,missing_key = check_parameter(data.keys(), ["username","password","state"])
        if missing_key != []: return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
        if data["username"] != "" and data["password"] != "":
            # result_login_one = login_one_id(data)
            # for testing
            result_login_one = {}
            result_login_one["result"] = 'aaa'
            result_login_one['access_token'] = '123'
            result_login_one['refresh_token'] = '123'
            ###################################
            if result_login_one["result"] != "Fail":
                username = data['username'].split('@')
                # user = user + '@one.th'
                user = sess.query(User).filter_by(username=username[0]).first()
                if user != None:
                    relation = sess.query(User_Relation).filter_by(id_user=user.id).all()
                    relation_list = []
                    for group_l1 in relation:
                        relation_group = {}
                        relation_dict = helper.serialize(group_l1)
                        group = sess.query(User_Group).filter_by(id=relation_dict['id_group']).first()
                        group_dict = helper.serialize(group)
                        relation_group['group_id'] = group_dict['id']
                        relation_group['group_name'] = group_dict['name']
                        relation_group['user_level'] = relation_dict['level']
                        relation_list.append(relation_group)
                    # profile_one = profile_one_id(result_login_one['access_token'])
                    #for testing
                    profile_one = {}
                    profile_one['first_name_th'] = 'first'
                    profile_one['last_name_th'] = 'last'
                    ############################################
                    access_token, refresh_token, expire = generate_token(user.id, user.username, user.role, data["state"],result_login_one['access_token'],result_login_one['refresh_token'],profile_one['first_name_th'],profile_one['last_name_th'])
                    session_time = datetime.datetime.now() + datetime.timedelta(minutes=SESSION_TIME)
                    value = datetime.datetime.fromtimestamp(float(expire))
                    expire = value.strftime('%d %B %Y %H:%M:%S')
                    return json_response({"access_token": access_token, "refresh_token": refresh_token, "expire_at": expire,
                                          "role": user.role, "user_id": user.id,"username": user.username,"position": user.position,"tel":user.tel, "relation": relation_list,
                                          "fname": '', "lname": ''}, 200)
                else:
                    elip_time = start_time - time.time()
                    print 'time =' + str(elip_time)
                    print "no username"
                    return json_response({"message": "no username"}, 400)
            else:
                elip_time = start_time - time.time()
                print 'time =' + str(elip_time)
                print "check auth one fail"
                return json_response({"onemessage": result_login_one["errorMessage"], "message": "username or password incorrect"}, 400)
        else:
            elip_time = start_time - time.time()
            print 'time =' + str(elip_time)
            print "invalid username password"
            return json_response({"message": "missing username or password"}, 400)
    except Exception as e:
        print 'error login api: ', e
        return json_response({"message": e.message}, 400)

@check_ticket
def apiLoginAdmin():
    global sess
    start_time = time.time()
    pass_pattern = "^[A-Za-z\d@$!%*?&]{7,20}$"
    data = request.json
    try:
        _,missing_key = check_parameter(data.keys(), ["username","password","state"])
        if missing_key != []: return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
        if data["username"] != "" and data["password"] != "":
            # result_login_one = login_one_id(data)
            # result_login_one = ""
            # for testing
            result_login_one = {}
            result_login_one["result"] = 'aaa'
            result_login_one['access_token'] = '123'
            result_login_one['refresh_token'] = '123'
            ###################################
            if result_login_one["result"] != "Fail":
                username = data['username'].split('@')
                # user = user + '@one.th'
                user = sess.query(User).filter_by(username=username[0]).first()
                if user != None:
                    relation = sess.query(User_Relation).filter_by(id_user=user.id).all()
                    relation_list = []
                    for group_l1 in relation:
                        relation_group = {}
                        relation_dict = helper.serialize(group_l1)
                        group = sess.query(User_Group).filter_by(id=relation_dict['id_group']).first()
                        group_dict = helper.serialize(group)
                        relation_group['group_id'] = group_dict['id']
                        relation_group['group_name'] = group_dict['name']
                        relation_group['user_level'] = relation_dict['level']
                        relation_list.append(relation_group)
                    if user.role != "admin":
                        return json_response({"message": "Error Role user is not Admin"}, 400)
                    # profile_one = profile_one_id(result_login_one['access_token'])
                    #for testing
                    profile_one = {}
                    profile_one['first_name_th'] = 'first'
                    profile_one['last_name_th'] = 'last'
                    ############################################
                    access_token, refresh_token, expire = generate_token(user.id, user.username, user.role, data["state"],result_login_one['access_token'],result_login_one['refresh_token'],profile_one['first_name_th'],profile_one['last_name_th'])
                    session_time = datetime.datetime.now() + datetime.timedelta(minutes=SESSION_TIME)
                    value = datetime.datetime.fromtimestamp(float(expire))
                    expire = value.strftime('%d %B %Y %H:%M:%S')
                    return json_response({"access_token": access_token, "refresh_token": refresh_token, "expire_at": expire,
                                          "role": user.role, "user_id": user.id,"username": user.username,"position": user.position,"tel":user.tel, "relation": relation_list,
                                          "fname": '', "lname": ''}, 200)
                else:
                    elip_time = start_time - time.time()
                    print 'time =' + str(elip_time)
                    print "no username"
                    return json_response({"message": "no username"}, 400)
            else:
                elip_time = start_time - time.time()
                print 'time =' + str(elip_time)
                print "check auth one fail"
                return json_response({"onemessage": data_gettoken["errorMessage"], "message": "username or password incorrect"}, 400)
        else:
            elip_time = start_time - time.time()
            print 'time =' + str(elip_time)
            print "invalid username password"
            return json_response({"message": "missing username or password"}, 400)
    except Exception as e:
        print 'error login admin api: ', e
        return json_response({"message": e.message}, 400)

@check_token("user")
def apiLogout(username=None):
    try:
        print 'begin api ------------------'
        access_token = request.headers.get('Authorization')
        print 'access_token: ' ,access_token
        refresh_token =  cache.get('access_token:'+access_token)
        if refresh_token is not None:
            try:
                refresh_token = refresh_token.split(':')[2]
                cache.delete('refresh_token:'+refresh_token)
            except Exception as e:
                print '[logout] error get refresh token:' + e.message


        cache.delete('access_token:'+access_token)
        print 'finish api ------------------'
        return json_response({"message": "Log out Success"}, 200)
    except Exception as e:
        print 'error api log out: ',e
        return json_response({"message": e.message}, 400)

def apiRefreshToken():
    data = request.json
    if not (len(data) > 0) :
        return json_response({"message": "invalid input"}, 400)
        #check key
    valid,missing_key = helper.check_parameter(data,['refresh_token','access_token'])
    if len(missing_key) > 0:
        return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    token_data = decryption_message(data['refresh_token'])
    if len(token_data) <= 0 and (token_data.get('type', None) != "refresh"):
        print "no token"
        return json_response({"message": "Unauthorization"}, 401)
    print 'c:',cache.get('refresh_token:'+ data["refresh_token"])
    print 'a:',data.get("access_token","mismatch")
    if not (cache.get('refresh_token:'+ data["refresh_token"]) == data.get("access_token","mismatch")):
        print "refresh mismatch access"
        return json_response({"message": "Unauthorization"}, 401)
    cache.delete('refresh_token:' + data["refresh_token"])
    cache.delete('access_token:' + data.get("access_token", "None"))
    access_token,refresh_token, acc_expire = generate_token(token_data["user_id"],token_data["username"], token_data["role"], token_data["state"],'','',token_data['fname'],token_data['lname'])
    return json_response(
        {"access_token": access_token, "refresh_token": refresh_token, "expire_at": acc_expire}, 200)
