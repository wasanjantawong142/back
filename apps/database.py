# print 'start init db'
from .app import app
from flask_sqlalchemy import SQLAlchemy
from helper.helper import encryption_password
import time
import redis
import uuid
import datetime

cache = redis.Redis(
    host='203.154.83.127',
    port=6379)

db = SQLAlchemy(app)
def generate_uuid():
    uid = uuid.uuid4()
    print '----',uid
    return str(uid)

# id = db.Column(db.String, primary_key=True, default=generate_uuid)
class User(db.Model):
    __tablename__ = 'user_info'
    id = db.Column(db.String(20), primary_key=True)
    username  = db.Column(db.String(255), unique=True, nullable=False)
    tel  = db.Column(db.String(20))
    role = db.Column(db.String(10), nullable = False)
    position = db.Column(db.String(30), nullable = False)
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)

class User_Group(db.Model):
    __tablename__ = 'user_group_info'
    id = db.Column(db.Integer, primary_key=True, nullable = False, autoincrement=True)
    name  = db.Column(db.String(255), unique=True, nullable=False)
    position_type = db.Column(db.String(30), nullable = False)
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    inuse = db.Column(db.Boolean, nullable = False)

class User_Group_Relation(db.Model):
    __tablename__ = 'user_group_relation'
    id = db.Column(db.Integer, primary_key=True, nullable = False, autoincrement=True)
    id_group  = db.Column(db.Integer, nullable=False)
    id_group_child = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    inuse = db.Column(db.Boolean, nullable = False)

class User_Relation(db.Model):
    __tablename__ = 'user_relation'
    id = db.Column(db.Integer, primary_key=True, nullable = False, autoincrement=True)
    id_user  = db.Column(db.Integer, db.ForeignKey('user_info.id'), nullable=False)
    id_group  = db.Column(db.Integer, db.ForeignKey('user_group_info.id'), nullable=False)
    level  = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    inuse = db.Column(db.Boolean, nullable = False)
    _user_info = db.relationship('User')
    _user_group_info = db.relationship('User_Group')

class User_Relation_Log(db.Model):
    __tablename__ = 'user_relation_log'
    id = db.Column(db.Integer, primary_key=True, nullable = False, autoincrement=True)
    id_relation  = db.Column(db.Integer, db.ForeignKey('user_relation.id'), nullable=False)
    case_log  = db.Column(db.String(10), nullable=False)
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    _user_relation = db.relationship('User_Relation')

class BD(db.Model):
    __tablename__ = 'bd_info'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name  = db.Column(db.String(255), nullable=False)
    type = db.Column(db.String, nullable=False)
    ratio_engcost = db.Column(db.Float, nullable = False)
    version = db.Column(db.Integer)
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    inuse = db.Column(db.Boolean, nullable = False)

class BD_Log(db.Model):
    __tablename__ = 'bd_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_bd  = db.Column(db.Integer, db.ForeignKey('bd_info.id'), nullable=False)
    case_log = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    _bd_info = db.relationship('BD')

class Product(db.Model):
    __tablename__ = 'product_info'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_bd  = db.Column(db.Integer, db.ForeignKey('bd_info.id'), nullable=False)
    name = db.Column(db.String(255), nullable=False)
    product_code = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    inuse = db.Column(db.Boolean, nullable = False)
    _bd_info = db.relationship('BD')

class Product_Log(db.Model):
    __tablename__ = 'product_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_product  = db.Column(db.Integer, db.ForeignKey('product_info.id'), nullable=False)
    case_log = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    _product_info = db.relationship('Product')

class Item(db.Model):
    __tablename__ = 'item_info'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_product  = db.Column(db.Integer, db.ForeignKey('product_info.id'), nullable=False)
    name = db.Column(db.String(255), nullable=False)
    item_code = db.Column(db.String(255))
    units = db.Column(db.String(10))
    price = db.Column(db.Float)
    onetime = db.Column(db.Boolean)
    description = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    inuse = db.Column(db.Boolean, nullable = False)
    _product_info = db.relationship('Product')

class Item_Log(db.Model):
    __tablename__ = 'item_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_item  = db.Column(db.Integer, db.ForeignKey('item_info.id'), nullable=False)
    case_log = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    _item_info = db.relationship('Item')

class Bom_Main(db.Model):
    __tablename__ = 'bom_main'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    project_name  = db.Column(db.String(255), nullable=False)
    customer_id = db.Column(db.String(255))
    customer_name = db.Column(db.String(255))
    sale_id = db.Column(db.String(10), nullable=False)
    sale_name = db.Column(db.String(255), nullable=False)
    sale_tel = db.Column(db.String(255), nullable=False)
    presale_id = db.Column(db.String(10), nullable=False)
    presale_name = db.Column(db.String(255), nullable=False)
    presale_tel = db.Column(db.String(255), nullable=False)
    business_development_id = db.Column(db.Integer)
    business_development_name = db.Column(db.String(255))
    business_development_tel = db.Column(db.String(255))
    cost_id = db.Column(db.Integer)
    cost_name = db.Column(db.String(255))
    cost_tel = db.Column(db.String(255))
    contract = db.Column(db.Integer, nullable=False)
    total_sale_price = db.Column(db.Float, nullable=False)
    total_actualcost = db.Column(db.Float, nullable=False)
    total_engcost = db.Column(db.Float, nullable=False)
    total_engcost_per_month = db.Column(db.Float, nullable=False)
    sale_factor = db.Column(db.Float, nullable=False)
    version = db.Column(db.String(20))
    ref_type = db.Column(db.String(30))
    ref_id = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    inuse = db.Column(db.Boolean, nullable = False)

class Bom_Log(db.Model):
    __tablename__ = 'bom_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_bom  = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
    case_log = db.Column(db.String(255))
    version = db.Column(db.String(20))
    data_change = db.Column(db.Text)
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    remark = db.Column(db.String(255))
    _bom_main = db.relationship('Bom_Main')

class Bom_Sale_Log(db.Model):
    __tablename__ = 'bom_sale_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_bom  = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
    case_log = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    remark = db.Column(db.String(255))
    _bom_main = db.relationship('Bom_Main')

class Bom_Solution_Log(db.Model):
    __tablename__ = 'bom_solution_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_bom  = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
    case_log = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    remark = db.Column(db.String(255))
    _bom_main = db.relationship('Bom_Main')

class Bom_BD_Log(db.Model):
    __tablename__ = 'bom_bd_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_bom  = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
    bd_name = db.Column(db.String(255))
    case_log = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    remark = db.Column(db.String(255))
    _bom_main = db.relationship('Bom_Main')

class Bom_BD(db.Model):
    __tablename__ = 'bom_bd'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    id_bom  = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
    id_bd = db.Column(db.Integer, nullable=False)
    bd_name = db.Column(db.String(255))
    inuse = db.Column(db.Boolean, nullable = False)
    _bom_main = db.relationship('Bom_Main')

class Bom_Diagram(db.Model):
    __tablename__ = 'bom_diagram'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    id_bom  = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
    path = db.Column(db.String(255), nullable=False)
    img_name = db.Column(db.String(255))
    inuse = db.Column(db.Boolean, nullable = False)
    _bom_main = db.relationship('Bom_Main')

class Bom_Ref_File(db.Model):
    __tablename__ = 'bom_ref_file'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    id_bom  = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
    path = db.Column(db.String(255), nullable=False)
    file_name = db.Column(db.String(255))
    file_type = db.Column(db.String(255))
    inuse = db.Column(db.Boolean, nullable = False)
    _bom_main = db.relationship('Bom_Main')

class Bom_Item(db.Model):
    __tablename__ = 'bom_item'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    id_bom  = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
    id_bd  = db.Column(db.Integer, db.ForeignKey('bd_info.id'), nullable=False)
    bd_name = db.Column(db.String(255))
    id_product  = db.Column(db.Integer, db.ForeignKey('product_info.id'), nullable=False)
    product_name = db.Column(db.String(255))
    id_item  = db.Column(db.Integer, db.ForeignKey('item_info.id'), nullable=False)
    item_name = db.Column(db.String(255))
    inuse = db.Column(db.Boolean, nullable = False)
    _bom_main = db.relationship('Bom_Main')
    _bd_info = db.relationship('BD')
    _product_info = db.relationship('Product')
    _item_info = db.relationship('Item')

class Bom_Item_Price(db.Model):
    __tablename__ = 'bom_item_price'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    # id_bom_item  = db.Column(db.Integer, db.ForeignKey('bom_item.id'), nullable=False)
    id_bom_item  = db.Column(db.Integer,nullable=False)
    item_ratio_engcost = db.Column(db.Float)
    item_unit_amount = db.Column(db.Integer)
    item_unit = db.Column(db.String(20))
    item_unit_price = db.Column(db.Float)
    item_amount_price = db.Column(db.Float)
    item_actualcost = db.Column(db.Float)
    item_ratio_actualcost = db.Column(db.Float)
    item_engcost = db.Column(db.Float)
    onetime = db.Column(db.Boolean, nullable = False)
    item_engcost_month = db.Column(db.Float)
    inuse = db.Column(db.Boolean, nullable = False)
    # _bom_item = db.relationship('Bom_Item')

class Bom_Main_Old(db.Model):
    __tablename__ = 'bom_main_old'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_bom_main = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable = False)
    project_name  = db.Column(db.String(255), nullable=False)
    customer_name = db.Column(db.String(255))
    sale_id = db.Column(db.String(10), nullable=False)
    sale_name = db.Column(db.String(255), nullable=False)
    sale_tel = db.Column(db.String(255), nullable=False)
    presale_id = db.Column(db.String(10), nullable=False)
    presale_name = db.Column(db.String(255), nullable=False)
    presale_tel = db.Column(db.String(255), nullable=False)
    business_development_id = db.Column(db.Integer)
    business_development_name = db.Column(db.String(255))
    business_development_tel = db.Column(db.String(255))
    cost_id = db.Column(db.Integer)
    cost_name = db.Column(db.String(255))
    cost_tel = db.Column(db.String(255))
    contract = db.Column(db.Integer, nullable=False)
    total_sale_price = db.Column(db.Float, nullable=False)
    total_actualcost = db.Column(db.Float, nullable=False)
    total_engcost = db.Column(db.Float, nullable=False)
    total_engcost_per_month = db.Column(db.Float, nullable=False)
    sale_factor = db.Column(db.Float, nullable=False)
    version = db.Column(db.String(20))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.String(20), nullable = False)
    inuse = db.Column(db.Boolean, nullable = False)
    _bom_main = db.relationship('Bom_Main')

class Bom_Item_Old(db.Model):
    __tablename__ = 'bom_item_old'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    id_bom_old  = db.Column(db.Integer, db.ForeignKey('bom_main_old.id'), nullable=False)
    id_bd = db.Column(db.Integer, db.ForeignKey('bd_info.id'), nullable=False)
    bd_name = db.Column(db.String(255))
    id_product  = db.Column(db.Integer, db.ForeignKey('product_info.id'), nullable=False)
    product_name = db.Column(db.String(255))
    id_item  = db.Column(db.Integer, db.ForeignKey('item_info.id'), nullable=False)
    item_name = db.Column(db.String(255))
    inuse = db.Column(db.Boolean, nullable = False)
    _bom_main_old = db.relationship('Bom_Main_Old')
    _bd_info = db.relationship('BD')
    _product_info = db.relationship('Product')
    _item_info = db.relationship('Item')

class Bom_BD_Old(db.Model):
    __tablename__ = 'bom_bd_old'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    id_bom_old  = db.Column(db.Integer, db.ForeignKey('bom_main_old.id'), nullable=False)
    id_bd = db.Column(db.Integer, nullable=False)
    bd_name = db.Column(db.String(255))
    inuse = db.Column(db.Boolean, nullable = False)
    _bom_main_old = db.relationship('Bom_Main_Old')

class Bom_Diagram_Old(db.Model):
    __tablename__ = 'bom_diagram_old'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    id_bom_old  = db.Column(db.Integer, db.ForeignKey('bom_main_old.id'), nullable=False)
    path = db.Column(db.String(255), nullable=False)
    img_name = db.Column(db.String(255))
    inuse = db.Column(db.Boolean, nullable = False)
    _bom_main = db.relationship('Bom_Main_Old')

class Bom_Ref_File_Old(db.Model):
    __tablename__ = 'bom_ref_file_old'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    id_bom  = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
    path = db.Column(db.String(255), nullable=False)
    file_name = db.Column(db.String(255))
    file_type = db.Column(db.String(255))
    inuse = db.Column(db.Boolean, nullable = False)
    _bom_main = db.relationship('Bom_Main')

class Bom_Item_Price_Old(db.Model):
    __tablename__ = 'bom_item_price_old'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    id_bom_item_old  = db.Column(db.Integer, db.ForeignKey('bom_item_old.id'), nullable=False)
    item_ratio_engcost = db.Column(db.Float)
    item_unit_amount = db.Column(db.Integer)
    item_unit = db.Column(db.String(20))
    item_unit_price = db.Column(db.Float)
    item_amount_price = db.Column(db.Float)
    item_actualcost = db.Column(db.Float)
    item_ratio_actualcost = db.Column(db.Float)
    item_engcost = db.Column(db.Float)
    onetime = db.Column(db.Boolean, nullable = False)
    item_engcost_month = db.Column(db.Float)
    inuse = db.Column(db.Boolean, nullable = False)
    _bom_item_old = db.relationship('Bom_Item_Old')

class Request(db.Model):
    __tablename__ = 'request_info'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    subject  = db.Column(db.String(255), nullable=False)
    main = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.Integer)
    inuse = db.Column(db.Boolean, nullable = False)

class Request_To(db.Model):
    __tablename__ = 'request_to'
    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    id_request  = db.Column(db.Integer, db.ForeignKey('request_info.id'), nullable=False)
    request_to = db.Column(db.String(255))
    _request_info = db.relationship('Request')

class Request_Log(db.Model):
    __tablename__ = 'request_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_request  = db.Column(db.Integer, db.ForeignKey('request_info.id'), nullable=False)
    case_log = db.Column(db.String(255))
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    create_by = db.Column(db.Integer)
    comment = db.Column(db.Text)
    _request_info = db.relationship('Request')

class Bom_POC_Status(db.Model):
    __tablename__ = 'bom_poc_status'
    id_bom = db.Column(db.Integer, primary_key=True)
    status = db.Column(db.Boolean, nullable = False)
    create_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    modify_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)

class Bom_VM_Resource(db.Model):
    __tablename__ = 'bom_vm_resource'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_bom = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
    name_server = db.Column(db.String(100))
    cpu = db.Column(db.Integer)
    memory = db.Column(db.Integer)
    disk = db.Column(db.Integer)
    os = db.Column(db.String(100))
    sql = db.Column(db.String(100))
    additional = db.Column(db.String(100))
    inuse = db.Column(db.Boolean)
    _bom_main = db.relationship('Bom_Main')

class Bom_VM_Resource_Old(db.Model):
    __tablename__ = 'bom_vm_resource_old'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_bom_old = db.Column(db.Integer, db.ForeignKey('bom_main_old.id'), nullable=False)
    name_server = db.Column(db.String(100))
    cpu = db.Column(db.Integer)
    memory = db.Column(db.Integer)
    disk = db.Column(db.Integer)
    os = db.Column(db.String(100))
    sql = db.Column(db.String(100))
    additional = db.Column(db.String(100))
    inuse = db.Column(db.Boolean)
    _bom_main_old = db.relationship('Bom_Main_Old')

# class Bom_VM_OS(db.Model):
#     __tablename__ = 'bom_vm_os'
#     id = db.Column(db.Integer, primary_key=True, autoincrement=True)
#     id_bom_ = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
#     os_name = db.Column(db.String(100))
#     inuse = db.Column(db.Boolean)
#     _bom_main = db.relationship('Bom_Main')
#
# class Bom_VM_OS_Old(db.Model):
#     __tablename__ = 'bom_vm_os_old'
#     id = db.Column(db.Integer, primary_key=True, autoincrement=True)
#     id_bom_old = db.Column(db.Integer, db.ForeignKey('bom_main_old.id'), nullable=False)
#     os_name = db.Column(db.String(100))
#     inuse = db.Column(db.Boolean)
#     _bom_main_old = db.relationship('Bom_Main_Old')
#
# class Bom_VM_Sql(db.Model):
#     __tablename__ = 'bom_vm_sql'
#     id = db.Column(db.Integer, primary_key=True, autoincrement=True)
#     id_bom_ = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
#     sql_name = db.Column(db.String(100))
#     inuse = db.Column(db.Boolean)
#     _bom_main = db.relationship('Bom_Main')
#
# class Bom_VM_Sql_Old(db.Model):
#     __tablename__ = 'bom_vm_sql_old'
#     id = db.Column(db.Integer, primary_key=True, autoincrement=True)
#     id_bom_old = db.Column(db.Integer, db.ForeignKey('bom_main_old.id'), nullable=False)
#     sql_name = db.Column(db.String(100))
#     inuse = db.Column(db.Boolean)
#     _bom_main_old = db.relationship('Bom_Main_Old')
#
# class Bom_VM_Additional(db.Model):
#     __tablename__ = 'bom_vm_additional'
#     id = db.Column(db.Integer, primary_key=True, autoincrement=True)
#     id_bom_ = db.Column(db.Integer, db.ForeignKey('bom_main.id'), nullable=False)
#     name = db.Column(db.String(100))
#     inuse = db.Column(db.Boolean)
#     _bom_main = db.relationship('Bom_Main')
#
# class Bom_VM_Additional_Old(db.Model):
#     __tablename__ = 'bom_vm_additional_old'
#     id = db.Column(db.Integer, primary_key=True, autoincrement=True)
#     id_bom_old = db.Column(db.Integer, db.ForeignKey('bom_main_old.id'), nullable=False)
#     name = db.Column(db.String(100))
#     inuse = db.Column(db.Boolean)
#     _bom_main_old = db.relationship('Bom_Main_Old')

def init_db():
    print 'create db'
    # db.engine.execute("drop database let_do_it cascade;")
    # db.engine.execute("create database let_do_it;")
    # db.engine.execute("drop table scripts;")
    db.create_all()
    # encrypt_password = encryption_password("mis@Pass01")
    # dep_list = ["Software Defined Infrastructure","Flexpod","HPE-Cloud","Dell-Cloud","UNIX","Nutanix","Network","SQA"
    #             ,"VDI","INET-MS"]
    # for dep in dep_list:
    #     department = Department(name=dep)
    #     db.session.add(department)
    #     db.session.commit()
    # department = Department.query.filter_by(name="Software Defined Infrastructure").first()
    # new_user = User(username="admin", password=encrypt_password, role="admin",department_id=department.response()["id"])
    # db.session.add(new_user)
    # db.session.commit()


# print 'finish init db'
