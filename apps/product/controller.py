from ..helper.helper import json_response, check_parameter_table,check_parameter
from ..authener import controller as authener
from flask import request
from ..database import db,BD,Product,Item,BD_Log,Product_Log,Item_Log
from ..helper import helper
from sqlalchemy.exc import IntegrityError
from sqlalchemy.sql.expression import or_,and_,func
import datetime
from ..app import app
sess = db.session

@authener.check_token("user")
def getProduct(role_user,team_user):
    global sess
    try:
        if role_user == 'bd':
            bd_info = sess.query(BD).filter(and_(BD.name == team_user,BD.inuse == True)).all()
            product_list = []
            for bd in bd_info:
                bd_value = helper.serialize(bd)
                product_info = sess.query(Product).filter((Product.id_bd==bd_value['id'])).all()
                for product in product_info:
                    product_row = {}
                    product_value = helper.serialize(product)
                    product_row['id_bd'] = bd_value['id']
                    product_row['name_bd'] = bd_value['name']
                    product_row['id_product'] = product_value['id']
                    product_row['name_product'] = product_value['name']
                    product_row['product_code'] = product_value['product_code']
                    product_row['create_date'] = product_value['create_date']
                    product_row['create_by'] = product_value['create_by']
                    product_row['inuse'] = product_value['inuse']
                    product_list.append(product_row)
            return json_response({"product": product_list}, 200)
        elif role_user == 'cost':
            bd_info = sess.query(BD).filter(and_(BD.type == 'JV', BD.inuse == True)).all()
            product_list = []
            for bd in bd_info:
                bd_value = helper.serialize(bd)
                product_info = sess.query(Product).filter((Product.id_bd==bd_value['id'])).all()
                for product in product_info:
                    product_row = {}
                    product_value = helper.serialize(product)
                    product_row['id_bd'] = bd_value['id']
                    product_row['name_bd'] = bd_value['name']
                    product_row['id_product'] = product_value['id']
                    product_row['name_product'] = product_value['name']
                    product_row['product_code'] = product_value['product_code']
                    product_row['create_date'] = product_value['create_date']
                    product_row['create_by'] = product_value['create_by']
                    product_row['inuse'] = product_value['inuse']
                    product_list.append(product_row)
            return json_response({"product": product_list}, 200)
        elif role_user == 'admin':
            bd_info = sess.query(BD).filter((BD.inuse == True)).all()
            product_list = []
            for bd in bd_info:
                bd_value = helper.serialize(bd)
                product_info = sess.query(Product).filter((Product.id_bd==bd_value['id'])).all()
                for product in product_info:
                    product_row = {}
                    product_value = helper.serialize(product)
                    product_row['id_bd'] = bd_value['id']
                    product_row['name_bd'] = bd_value['name']
                    product_row['id_product'] = product_value['id']
                    product_row['name_product'] = product_value['name']
                    product_row['product_code'] = product_value['product_code']
                    product_row['create_date'] = product_value['create_date']
                    product_row['create_by'] = product_value['create_by']
                    product_row['inuse'] = product_value['inuse']
                    product_list.append(product_row)
            return json_response({"product": product_list}, 200)
        else:
            return json_response({"message": 'not your role'}, 400)
    except Exception as e:
        print 'error api get product to manage: ', e
        json_response({"message": e.message}, 400)

@authener.check_token("user")
def createProduct():
    global sess
    data = request.json
    data_create = data['product_document']
    parameter_check = ["name_product","id_bd","code_product","create_by"]
    _,missing_key = check_parameter(data_create.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        new_product = Product(
            id_bd = data_create.get("id_bd", None),
            name = data_create.get("name_product", None),
            create_by = data_create.get("create_by", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            inuse = True
        )
        sess.add(new_product)
        product_info = sess.query(Product).filter(and_(Product.name == data_create['name_product'],Product.inuse == True)).order_by((Product.id).desc()).limit(1)
        for product in product_info:
            product_dict = helper.serialize(product)
            new_product_log = Product_Log(
                id_product = product_dict["id"],
                case_log = "CREATE",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create["create_by"]
            )
            sess.add(new_product_log)
        sess.commit()
        return json_response({"message": "Create Complete", "status": 'success'},200)
    except Exception as e:
        print 'error create product: ', e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("user")
def blockProduct(id_product,user_id,block):
    global sess
    try:
        if block == "true":
            update_product = Product.query.filter_by(id =id_product).update(dict(inuse = False))
            new_product_log = Product_Log(
                id_product = id_product,
                case_log = "BLOCK",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = user_id
            )
            sess.add(new_product_log)
            sess.commit()
            return json_response({"message": "Block Complete", "status": 'success'},200)
        else:
            update_product = Product.query.filter_by(id =id_product).update(dict(inuse = True))
            new_product_log = Product_Log(
                id_product = id_product,
                case_log = "UNBLOCK",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = user_id
            )
            sess.add(new_product_log)
            sess.commit()
            return json_response({"message": "Unblock Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api block product: ',e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("user")
def editProduct():
    global sess
    data = request.json
    data_edit = data['product_document']
    parameter_check = ["id_product","name_product","code_product","create_by"]
    _,missing_key = check_parameter(data_edit.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        update_product = Product.query.filter_by(id =data_edit["id_product"]).update(dict(name = data_edit['name_product'], product_code = data_edit['code_product']))
        new_product_log = Product_Log(
            id_product = data_edit["id_product"],
            case_log = "EDIT",
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            create_by = data_edit["create_by"]
        )
        sess.add(new_product_log)
        sess.commit()
        return json_response({"message": "Edit Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api edit product: ',e
        sess.rollback()
        return json_response({"message": e.message},400)
