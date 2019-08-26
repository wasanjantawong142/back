# -*- coding: utf-8 -*-
import xlsxwriter
import os
import sys
import io
from flask import Response, json, request
import json
import re
from functools import wraps
import hashlib
import json
import requests
from json import dumps
from sqlalchemy.orm import class_mapper
from bson import json_util
import datetime

def createXlsx(data):
    try:
        # os.path.dirname(os.path.abspath(__file__))
        # os.remove(os.getcwd() + "/apps/boms/export_file/bom_report-" + str(data['id']) + ".xlsx")
        workbook = xlsxwriter.Workbook(os.getcwd() + "/apps/boms/export_file/bom_report-" + str(data['id']) + ".xlsx")
        worksheet = workbook.add_worksheet()
        normal_subject_format = workbook.add_format({'bold': True, 'font_name': 'Tohoma'})
        subject_format = workbook.add_format({'bold': True, 'font_name': 'Tohoma'})
        subject_format.set_border(1)
        normal_body_format = workbook.add_format({'font_name': 'Tohoma'})
        body_format = workbook.add_format({'font_name': 'Tohoma'})
        body_format.set_border(1)
        # subject_format.set_font_name("Tohoma")
        # subject_format.set_font_size(11)

        worksheet.set_column(0, 0, 17.71)
        worksheet.set_column(1, 1, 90.71)
        worksheet.set_column(2, 2, 11.14)
        worksheet.set_column(3, 3, 13.43)
        worksheet.set_column(4, 4, 20.14)
        worksheet.set_column(5, 5, 20.57)
        worksheet.set_column(6, 6, 20.86)
        worksheet.set_column(7, 7, 18.00)
        worksheet.set_column(8, 8, 24.43)
        worksheet.set_column(9, 9, 25.00)

    # ------------------------------------------------------------------------------------------------ header
        worksheet.write(0,2,("เอกสารสนับสนุน (แบบฟอร์ม)").decode('utf-8'),normal_subject_format)
        worksheet.write(0,5,("หน่วยงาน :  ส่วนงานบริหารต้นทุนองค์กร").decode('utf-8'),normal_subject_format)
        worksheet.write(0,7,("version " + str(data['version'])).decode('utf-8'),normal_subject_format)
        worksheet.write(0,8,("วันที่บังคับใช้ : 09/05/2016").decode('utf-8'),normal_subject_format)

        worksheet.write(1,2,("หัวข้อ : BOM (Bill of Material) Cost").decode('utf-8'),normal_subject_format)
        worksheet.write(1,5,("FM-BOM Cost").decode('utf-8'))
        worksheet.write(1,7,("ผู้อนุมัติ :").decode('utf-8'),normal_subject_format)
        worksheet.write(1,8,("หรรษา นวาระพรรณ").decode('utf-8'))
        worksheet.write(1,9,("หน้า :  1/1").decode('utf-8'),normal_subject_format)

        worksheet.write(2,1,("Cost Project  : " + data['project_name']).decode('utf-8'),normal_subject_format)
        worksheet.write(3,1,("Sale  : " + data['sale_name']).decode('utf-8'),normal_subject_format)

        worksheet.write(4,1,("Pre-sale : " + data['presale_name']).decode('utf-8'),normal_subject_format)

        worksheet.write(4,5,("Actual Cost").decode('utf-8'),normal_subject_format)
        worksheet.write(4,6,data['total_actualcost'],normal_subject_format)
        worksheet.write(4,7,("Eng. Cost/Year").decode('utf-8'),normal_subject_format)
        worksheet.write(4,8,data['total_engcost'],normal_subject_format)

        worksheet.write(5,1,("BD : ").decode('utf-8'),normal_subject_format)

        worksheet.write(6,1,("Cost : ").decode('utf-8'),normal_subject_format)

        worksheet.write(8,3,("Contract").decode('utf-8'),normal_subject_format)
        worksheet.write(8,4,data['contract'],normal_subject_format)
        worksheet.write(8,5,("Month").decode('utf-8'),normal_subject_format)

        worksheet.write(9,0,("JV").decode('utf-8'),normal_subject_format)
        worksheet.write(9,1,("Cost Project : ").decode('utf-8'),subject_format)
        worksheet.write(9,2,("Unit").decode('utf-8'),subject_format)
        worksheet.write(9,3,"",subject_format)
        worksheet.write(9,4,("Unit/Price").decode('utf-8'),subject_format)
        worksheet.write(9,5,("Price").decode('utf-8'),subject_format)
        worksheet.write(9,6,("Actual Cost").decode('utf-8'),subject_format)
        worksheet.write(9,7,"",subject_format)
        worksheet.write(9,8,("Eng. Cost").decode('utf-8'),subject_format)
        worksheet.write(9,9,("Eng. Cost/Month").decode('utf-8'),subject_format)

        count_row = 10
    # ------------------------------------------------------------------------------------------------ onetime
        check_onetime = True
        for product_onetime in data['product_onetime']:
            if len(product_onetime['item']) > 0 and check_onetime:
                worksheet.write(count_row,1,("One Time Charge").decode('utf-8'),subject_format)
                worksheet.write(count_row, 2, '',body_format) #item_unit_amount
                worksheet.write(count_row, 3, '',body_format)#item_unit
                worksheet.write(count_row, 4, '',body_format)#item_unit_price
                worksheet.write(count_row, 5, '',body_format) #item_amount_price
                worksheet.write(count_row, 6, '',body_format) #item_actualcost
                worksheet.write(count_row, 7, '',body_format) #item_ratio_actualcost
                worksheet.write(count_row, 8, '',body_format)#item_engcost
                worksheet.write(count_row, 9, '',body_format)#item_engcost_month
                count_row = count_row + 1
                check_onetime = False

            worksheet.write(count_row, 1, (product_onetime["product_name"]).decode('utf-8'),subject_format)
            worksheet.write(count_row, 2, '',body_format) #item_unit_amount
            worksheet.write(count_row, 3, '',body_format)#item_unit
            worksheet.write(count_row, 4, '',body_format)#item_unit_price
            worksheet.write(count_row, 5, '',body_format) #item_amount_price
            worksheet.write(count_row, 6, '',body_format) #item_actualcost
            worksheet.write(count_row, 7, '',body_format) #item_ratio_actualcost
            worksheet.write(count_row, 8, '',body_format)#item_engcost
            worksheet.write(count_row, 9, '',body_format)#item_engcost_month
            count_row = count_row + 1

            for item_onetime in product_onetime['item']:
                worksheet.write(count_row, 0, ('BD: ' + item_onetime["bd_name"]).decode('utf-8'),normal_body_format) #bd name
                worksheet.write(count_row, 1, (item_onetime["item_name"]).decode('utf-8'),body_format) #item_name
                worksheet.write(count_row, 2, item_onetime["item_unit_amount"],body_format) #item_unit_amount
                worksheet.write(count_row, 3, str(item_onetime["item_unit"]),body_format)#item_unit
                worksheet.write(count_row, 4, item_onetime["item_unit_price"],body_format)#item_unit_price
                worksheet.write(count_row, 5, item_onetime["item_amount_price"],body_format) #item_amount_price
                worksheet.write(count_row, 6, item_onetime["item_actualcost"],body_format) #item_actualcost
                worksheet.write(count_row, 7, str(item_onetime["item_ratio_actualcost"]) + '%',body_format) #item_ratio_actualcost
                worksheet.write(count_row, 8, item_onetime["item_engcost"],body_format)#item_engcost
                worksheet.write(count_row, 9, item_onetime["item_engcost_month"],body_format)#item_engcost_month
                count_row = count_row + 1
    # # ------------------------------------------------------------------------------------------------ recurring
        check_recurring = True
        for product_recurring in data['product_recurring']:
            if len(product_recurring['item']) > 0 and check_recurring:
                worksheet.write(count_row,1,("Recurring").decode('utf-8'),subject_format)
                worksheet.write(count_row, 2, '',body_format) #item_unit_amount
                worksheet.write(count_row, 3, '',body_format)#item_unit
                worksheet.write(count_row, 4, '',body_format)#item_unit_price
                worksheet.write(count_row, 5, '',body_format) #item_amount_price
                worksheet.write(count_row, 6, '',body_format) #item_actualcost
                worksheet.write(count_row, 7, '',body_format) #item_ratio_actualcost
                worksheet.write(count_row, 8, '',body_format)#item_engcost
                worksheet.write(count_row, 9, '',body_format)#item_engcost_month
                count_row = count_row + 1
                check_recurring = False

            worksheet.write(count_row, 1, (product_recurring["product_name"]).decode('utf-8'),subject_format)
            worksheet.write(count_row, 2, '',body_format) #item_unit_amount
            worksheet.write(count_row, 3, '',body_format)#item_unit
            worksheet.write(count_row, 4, '',body_format)#item_unit_price
            worksheet.write(count_row, 5, '',body_format) #item_amount_price
            worksheet.write(count_row, 6, '',body_format) #item_actualcost
            worksheet.write(count_row, 7, '',body_format) #item_ratio_actualcost
            worksheet.write(count_row, 8, '',body_format)#item_engcost
            worksheet.write(count_row, 9, '',body_format)#item_engcost_month
            count_row = count_row + 1

            for item_recurring in product_recurring['item']:
                worksheet.write(count_row, 0, ('BD: ' + item_recurring["bd_name"]).decode('utf-8'),normal_body_format) #bd name
                worksheet.write(count_row, 1, (item_recurring["item_name"]).decode('utf-8'),body_format) #item_name
                worksheet.write(count_row, 2, item_recurring["item_unit_amount"],body_format) #item_unit_amount
                worksheet.write(count_row, 3, str(item_recurring["item_unit"]),body_format)#item_unit
                worksheet.write(count_row, 4, item_recurring["item_unit_price"],body_format)#item_unit_price
                worksheet.write(count_row, 5, item_recurring["item_amount_price"],body_format) #item_amount_price
                worksheet.write(count_row, 6, item_recurring["item_actualcost"],body_format) #item_actualcost
                worksheet.write(count_row, 7, str(item_recurring["item_ratio_actualcost"]) + '%',body_format) #item_ratio_actualcost
                worksheet.write(count_row, 8, item_recurring["item_engcost"],body_format)#item_engcost
                worksheet.write(count_row, 9, item_recurring["item_engcost_month"],body_format)#item_engcost_month
                count_row = count_row + 1

    # ------------------------------------------------------------------------------------------------ last
        worksheet.write(count_row, 1, 'Grand Total',subject_format)
        worksheet.write(count_row, 2, '',subject_format)
        worksheet.write(count_row, 3, '',subject_format)
        worksheet.write(count_row, 4, '',subject_format)
        worksheet.write(count_row, 5, '',subject_format)
        worksheet.write(count_row, 6, data['total_actualcost'],body_format)#total_actualcost
        worksheet.write(count_row, 7, '100.0%',body_format)#total_ratio_actualcost
        worksheet.write(count_row, 8, data['total_engcost'],body_format)#total_engcost
        worksheet.write(count_row, 9, data['total_engcost_per_month'],body_format)#total_engcost_per_month
        count_row = count_row + 1

        worksheet.write(count_row, 1, 'Total Eng. Cost',subject_format)
        worksheet.write(count_row, 2, data['contract'],subject_format)#contract
        worksheet.write(count_row, 3, 'Month',subject_format)
        worksheet.write(count_row, 4, '',subject_format)
        worksheet.write(count_row, 5, data['total_engcost'],subject_format)#total_engcost
        count_row = count_row + 1

        worksheet.write(count_row, 1, 'Eng.Cost per Month',subject_format)
        worksheet.write(count_row, 2, 1,subject_format)
        worksheet.write(count_row, 3, 'Month',subject_format)
        worksheet.write(count_row, 4, '',subject_format)
        worksheet.write(count_row, 5, data['total_engcost_per_month'],subject_format)#total_engcost_per_month
        worksheet.write(count_row, 7, ("ยอดเข้า").decode('utf-8'),body_format)
        worksheet.write(count_row, 8, '',body_format)
        count_row = count_row + 1

        worksheet.write(count_row, 1, 'Sale',subject_format)
        worksheet.write(count_row, 2, 'Sale',subject_format)
        worksheet.write(count_row, 3, 'Sale',subject_format)
        worksheet.write(count_row, 4, 'Sale',subject_format)
        worksheet.write(count_row, 5, data['total_sale_price'],subject_format)#total_sale_price
        worksheet.write(count_row, 7,("ยอดออก").decode('utf-8'),body_format)
        worksheet.write(count_row, 8, '',body_format)
        count_row = count_row + 1

        worksheet.write(count_row, 4, 'Sale Factor',subject_format)
        worksheet.write(count_row, 5, data['sale_factor'],subject_format)#total_sale_price
        worksheet.write(count_row, 7,("คิดเป็น").decode('utf-8'),body_format)
        worksheet.write(count_row, 8, '',body_format)
        count_row = count_row + 1

        worksheet.write(count_row, 0, 'Remark',subject_format)
        worksheet.write(count_row, 1, 'remark',body_format)#remark

        workbook.close()
        print 'def export excel'
        return True
    except Exception as e:
        print 'export excel error: ',e
        return False

def serialize(model):
  columns = [c.key for c in class_mapper(model.__class__).columns]
  return dict((c, getattr(model, c)) for c in columns)

def myconverter(o):
    if isinstance(o, datetime.datetime):
        return o.__str__()

def json_response(messages=None, status=None, headers=None):
    if headers == None:
        headers = dict()
    headers.update({"Content-Type": "application/json"})
    # contents = json.dumps(messages, default=json_util.default).replace('\'', '"')
    contents = json.dumps(messages, indent=4, sort_keys=True, default=str).replace('\'', '"')
    if(status == None):
        status = 200
    resp = Response(response=contents, headers=headers, status=int(status))
    return resp

def validator(text, pattern):
    # Compile request pattern into regular expression
    pattern_compiled = re.compile(pattern)
    return (True if pattern_compiled.match(text)!=None else False)
# def validSpecialCharacters(word):
#     if re.match("^[a-zA-Z0-9_]*$", word):
#         return "Valid"
#     else:
#         return "Invalid"
def check_validator(data):
    for k in data:
        # print "---------- text --------------"
        # print data[text]
        if(not validator(data[k], "^[a-zA-Z0-9_]*$")):
            return False, str(k) +  ' can not use special characters'
    return True, "Valid"

def encryption_password(password):
    shaHash = hashlib.sha256(password)
    encrypt_password = shaHash.hexdigest()
    return encrypt_password

def check_parameter(data, key):
    missing_key = []
    is_valid = True

    for k in key:
        if k not in data:
            missing_key.append(k)
            is_valid = False
    return is_valid,missing_key

def check_parameter_table(data, table, extension_key = None):
    key = [col.name for col in table.__table__.columns if not col.nullable and not col.primary_key or (col.unique and not col.nullable)]
    if extension_key != None:
        for k in extension_key:
            key.append(k)
    print key
    missing_key = []
    is_valid = True
    print data
    for k in key:
        if k not in data:
            missing_key.append(k)
            is_valid = False
    return missing_key

def check_ticket(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        return json_response({"message": "test decorator"})
    return decorated_function


def checkParameter(data, key):
    missing_key = []
    is_valid = True
    for k in key:
        if k not in data:
            missing_key.append(k)
            is_valid = False
    return is_valid, missing_key
