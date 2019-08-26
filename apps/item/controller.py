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
def root_endpoint():
    return json_response({"message": "department root endpoint"})

@authener.check_token("user")
def get_all_item():
    global sess
    try:
        bd_info = sess.query(BD).filter((BD.inuse == True)).all()
        item_list = []
        for bd in bd_info:
            bd_row = {}
            bd_value = helper.serialize(bd)
            bd_row['id'] = bd_value['id']
            bd_row['name'] = bd_value['name']
            bd_row['type'] = bd_value['type']
            bd_row['ratio_engcost'] = bd_value['ratio_engcost']
            bd_row['product'] = []
            product_info = sess.query(Product).filter(and_(Product.id_bd==bd_row['id'],Product.inuse == True)).all()
            for product in product_info:
                product_row = {}
                product_value = helper.serialize(product)
                product_row['id'] = product_value['id']
                product_row['name'] = product_value['name']
                product_row['item'] = []
                item_info = sess.query(Item).filter(and_(Item.id_product==product_row['id'],Item.inuse == True)).all()
                for item in item_info:
                    item_row = {}
                    item_value = helper.serialize(item)
                    item_row['id'] = item_value['id']
                    item_row['name'] = item_value['name']
                    item_row['units'] = item_value['units']
                    item_row['price_unit'] = item_value['price']
                    item_row['onetime'] = item_value['onetime']
                    item_row['checkitem'] = False
                    item_row['checkitem_add'] = False
                    item_row['amount_unit'] = 0
                    item_row['remark'] = ''
                    product_row['item'].append(item_row)
                bd_row['product'].append(product_row)
            item_list.append(bd_row)
        return json_response({"item": item_list}, 200)
    except Exception as e:
        print 'error api get item all:', e
        return json_response({"message": e.message}, 400)

@authener.check_token("user")
def getItem(role_user,team_user):
    global sess
    try:
        if role_user == 'bd':
            bd_info = sess.query(BD).filter(and_(BD.name == team_user, BD.type == 'INET', BD.inuse == True)).all()
            item_list = []
            for bd in bd_info:
                bd_value = helper.serialize(bd)
                product_info = sess.query(Product).filter((Product.id_bd==bd_value['id'])).all()
                for product in product_info:
                    product_row = {}
                    product_value = helper.serialize(product)
                    item_info = sess.query(Item).filter((Item.id_product==product_value['id'])).all()
                    for item in item_info:
                        item_row = {}
                        item_value = helper.serialize(item)
                        item_row['id_bd'] = bd_value['id']
                        item_row['name_bd'] = bd_value['name']
                        item_row['id_product'] = product_value['id']
                        item_row['name_product'] = product_value['name']
                        item_row['id_item'] = item_value['id']
                        item_row['name_item'] = item_value['name']
                        item_row['units'] = item_value['units']
                        item_row['price_unit'] = item_value['price']
                        item_row['onetime'] = item_value['onetime']
                        item_row['create_date'] = item_value['create_date']
                        item_row['create_by'] = item_value['create_by']
                        item_row['inuse'] = item_value['inuse']
                        item_list.append(item_row)
            return json_response({"item": item_list}, 200)
        elif role_user == 'cost':
            bd_info = sess.query(BD).filter(and_(BD.type == 'JV', BD.inuse == True)).all()
            item_list = []
            for bd in bd_info:
                bd_value = helper.serialize(bd)
                product_info = sess.query(Product).filter((Product.id_bd==bd_value['id'])).all()
                for product in product_info:
                    product_row = {}
                    product_value = helper.serialize(product)
                    item_info = sess.query(Item).filter((Item.id_product==product_value['id'])).all()
                    for item in item_info:
                        item_row = {}
                        item_value = helper.serialize(item)
                        item_row['id_bd'] = bd_value['id']
                        item_row['name_bd'] = bd_value['name']
                        item_row['id_product'] = product_value['id']
                        item_row['name_product'] = product_value['name']
                        item_row['id_item'] = item_value['id']
                        item_row['name_item'] = item_value['name']
                        item_row['units'] = item_value['units']
                        item_row['price_unit'] = item_value['price']
                        item_row['onetime'] = item_value['onetime']
                        item_row['create_date'] = item_value['create_date']
                        item_row['create_by'] = item_value['create_by']
                        item_row['inuse'] = item_value['inuse']
                        item_list.append(item_row)
            return json_response({"item": item_list}, 200)
        elif role_user == 'admin':
            bd_info = sess.query(BD).all()
            item_list = []
            for bd in bd_info:
                bd_value = helper.serialize(bd)
                product_info = sess.query(Product).filter((Product.id_bd==bd_value['id'])).all()
                for product in product_info:
                    product_row = {}
                    product_value = helper.serialize(product)
                    item_info = sess.query(Item).filter((Item.id_product==product_value['id'])).all()
                    for item in item_info:
                        item_row = {}
                        item_value = helper.serialize(item)
                        item_row['id_bd'] = bd_value['id']
                        item_row['name_bd'] = bd_value['name']
                        item_row['id_product'] = product_value['id']
                        item_row['name_product'] = product_value['name']
                        item_row['id_item'] = item_value['id']
                        item_row['name_item'] = item_value['name']
                        item_row['units'] = item_value['units']
                        item_row['price_unit'] = item_value['price']
                        item_row['onetime'] = item_value['onetime']
                        item_row['create_date'] = item_value['create_date']
                        item_row['create_by'] = item_value['create_by']
                        item_row['inuse'] = item_value['inuse']
                        item_list.append(item_row)
            return json_response({"item": item_list}, 200)
        else:
            return json_response({"message": 'not your role'}, 400)
    except Exception as e:
        print 'error api get item all to manage: ', e
        return json_response({"message": e.message}, 400)

@authener.check_token("user")
def createItem():
    global sess
    data = request.json
    data_create = data['item_document']
    parameter_check = ["item_name","id_product","units","price","onetime","create_by"]
    _,missing_key = check_parameter(data_create.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        print data_create['id_product']
        new_item = Item(
            id_product = data_create.get("id_product", None),
            name = data_create.get("item_name", None),
            units = data_create.get("units", None),
            price = data_create.get("price", None),
            onetime = data_create.get("onetime", None),
            create_by = data_create.get("create_by", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            inuse = True
        )
        sess.add(new_item)
        item_info = sess.query(Item).filter(and_(Item.name == data_create['item_name'],Item.inuse == True)).order_by((Item.id).desc()).limit(1)
        for item in item_info:
            item_dict = helper.serialize(item)
            print item_dict
            new_item_log = Item_Log(
                id_item = item_dict["id"],
                case_log = "CREATE",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create["create_by"]
            )
            sess.add(new_item_log)
        sess.commit()
        return json_response({"message": "Create Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api create item: ', e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("user")
def blockItem(id_item,user_id,block):
    global sess
    try:
        if block == "true":
            update_item = Item.query.filter_by(id =id_item).update(dict(inuse = False))
            new_item_log = Item_Log(
                id_item = id_item,
                case_log = "BLOCK",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = user_id
            )
            sess.add(new_item_log)
            sess.commit()
            return json_response({"message": "Block Complete", "status": 'success'},200)
        else:
            update_item = Item.query.filter_by(id =id_item).update(dict(inuse = True))
            new_item_log = Item_Log(
                id_item = id_item,
                case_log = "UNBLOCK",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = user_id
            )
            sess.add(new_item_log)
            sess.commit()
            return json_response({"message": "Unblock Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api block item',e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("user")
def editItem():
    global sess
    data = request.json
    data_edit = data['item_document']
    parameter_check = ["id_item","name_item","units","price","onetime","create_by"]
    _,missing_key = check_parameter(data_edit.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        update_item = Item.query.filter_by(id =data_edit["id_item"]).update(dict(name = data_edit['name_item'], units = data_edit['units'], price = data_edit['price'], onetime = data_edit['onetime']))
        new_item_log = Item_Log(
            id_item = data_edit["id_item"],
            case_log = "EDIT",
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            create_by = data_edit["create_by"]
        )
        sess.add(new_item_log)
        sess.commit()
        return json_response({"message": "Edit Complete", "status": 'success'},200)
    except Exception as e:
        print 'error api edit item: ',e
        sess.rollback()
        return json_response({"message": e.message},400)
