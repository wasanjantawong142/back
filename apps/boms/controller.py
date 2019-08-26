from ..helper.helper import json_response, check_parameter_table,check_parameter,createXlsx
from ..helper import helper
from flask import request, send_file
from ..database import *
from sqlalchemy.exc import IntegrityError
from sqlalchemy.sql.expression import or_,and_,func
from ..authener import controller as authener
sess = db.session
import datetime
from bson import json_util
import json
import os
from ..helper.request_api import poc_fuction
import base64

def get_bom_report_presale(user_id):
    global sess
    bom_report = {}
    id_bom_used = []
    bom_report_waiting = []
    bom_report_approve = []
    bom_report_reject = []
    # ----------------------------------------------------------------------------- waiting presale approve
    bom_solution_log_sub = sess.query(func.max(Bom_Solution_Log.id).label('idlog')).group_by(Bom_Solution_Log.id_bom).subquery('solution_log_sub')
    bom_solution_log = sess.query(Bom_Solution_Log).filter(Bom_Solution_Log.id.in_(bom_solution_log_sub)).subquery('solution_log')
    bom_main_waiting_presale = sess.query(Bom_Main,bom_solution_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "WAITING",or_(Bom_Main.presale_id == user_id, Bom_Main.create_by == user_id))).all()
    for id in bom_main_waiting_presale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = 'Waiting Team Lead approve'
        bom_report_waiting.append(bom_dict)
        id_bom_used.append(bom_dict['id'])

    bom_main_reject_bd = sess.query(Bom_Main).filter((~Bom_Main.id.in_(id_bom_used))).all()
    for id in bom_main_reject_bd:
        bom_dict = helper.serialize(id)
        id_bom_bd_log = sess.query(func.max(Bom_BD_Log.id).label('idlog')).filter((Bom_BD_Log.id_bom == bom_dict['id'])).group_by(Bom_BD_Log.bd_name).subquery('bd_log_sub')
        bom_bd_log = sess.query(Bom_BD,Bom_BD_Log).outerjoin(Bom_BD_Log,(Bom_BD.bd_name == Bom_BD_Log.bd_name)).filter(and_(Bom_BD.id_bom == bom_dict['id'],Bom_BD_Log.id_bom == bom_dict['id'],Bom_BD_Log.id.in_(id_bom_bd_log))).all()
        count_reject = 0
        for case in bom_bd_log:
            bd_log = helper.serialize(case.Bom_BD_Log)
            if bd_log['case_log'] == 'REJECT':
                count_reject = count_reject + 1
        if count_reject > 0:
            bom_dict["idlog"] = 0
            bom_dict["case_log"] = 'REJECT'
            bom_dict["log_create_date"] = ''
            bom_dict["remark"] = 'BD reject'
            bom_report_reject.append(bom_dict)
            id_bom_used.append(bom_dict['id'])

    bom_sale_log_sub = sess.query(func.max(Bom_Sale_Log.id).label('idlog')).group_by(Bom_Sale_Log.id_bom).subquery('sale_log_sub')
    bom_sale_log = sess.query(Bom_Sale_Log).filter(Bom_Sale_Log.id.in_(bom_sale_log_sub)).subquery('sale_log')
    bom_main_waiting_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(~Bom_Main.id.in_(id_bom_used),bom_solution_log.c.case_log == "APPROVE", bom_sale_log.c.case_log == "WAITING",or_(Bom_Main.presale_id == user_id, Bom_Main.create_by == user_id))).all()
    for id in bom_main_waiting_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = 'Waiting Sale approve'
        bom_report_waiting.append(bom_dict)
        id_bom_used.append(bom_dict['id'])
    # -----------------------------------------------------------------------------  sale approve
    bom_sale_log_sub = sess.query(func.max(Bom_Sale_Log.id).label('idlog')).group_by(Bom_Sale_Log.id_bom).subquery('sale_log_sub')
    bom_sale_log = sess.query(Bom_Sale_Log).filter(Bom_Sale_Log.id.in_(bom_sale_log_sub)).subquery('sale_log')
    bom_main_approve_sale = sess.query(Bom_Main,bom_sale_log).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(~Bom_Main.id.in_(id_bom_used),bom_sale_log.c.case_log == "APPROVE",or_(Bom_Main.presale_id == user_id, Bom_Main.create_by == user_id))).all()
    for id in bom_main_approve_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = 'Sale approve'
        bom_report_approve.append(bom_dict)
        id_bom_used.append(bom_dict['id'])

    # ----------------------------------------------------------------------------- presale reject
    bom_solution_log_sub = sess.query(func.max(Bom_Solution_Log.id).label('idlog')).group_by(Bom_Solution_Log.id_bom).subquery('solution_log_sub')
    bom_solution_log = sess.query(Bom_Solution_Log).filter(Bom_Solution_Log.id.in_(bom_solution_log_sub)).subquery('solution_log')
    bom_main_reject_presale = sess.query(Bom_Main,bom_solution_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).filter(and_(~Bom_Main.id.in_(id_bom_used),bom_solution_log.c.case_log == "REJECT",or_(Bom_Main.presale_id == user_id, Bom_Main.create_by == user_id))).all()
    for id in bom_main_reject_presale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = 'Team Lead reject'
        id_bom_used.append(id.id)
        bom_report_reject.append(bom_dict)

    bom_sale_log_sub = sess.query(func.max(Bom_Sale_Log.id).label('idlog')).group_by(Bom_Sale_Log.id_bom).subquery('sale_log_sub')
    bom_sale_log = sess.query(Bom_Sale_Log).filter(Bom_Sale_Log.id.in_(bom_sale_log_sub)).subquery('sale_log')
    bom_main_reject_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(~Bom_Main.id.in_(id_bom_used),bom_solution_log.c.case_log == "APPROVE", bom_sale_log.c.case_log == "REJECT",or_(Bom_Main.presale_id == user_id, Bom_Main.create_by == user_id))).all()
    for id in bom_main_reject_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = 'Sale reject'
        bom_report_reject.append(bom_dict)

    bom_report["waiting"] = bom_report_waiting
    bom_report["approve"] = bom_report_approve
    bom_report["reject"] = bom_report_reject
    return bom_report

def get_bom_report_lead_presale(user_id,user_in_order):
    global sess
    bom_report = {}
    # ----------------------------------------------------------------------------- waiting presale approve
    bom_report_waiting = []
    bom_solution_log_sub = sess.query(func.max(Bom_Solution_Log.id).label('idlog')).group_by(Bom_Solution_Log.id_bom).subquery('solution_log_sub')
    bom_solution_log = sess.query(Bom_Solution_Log).filter(Bom_Solution_Log.id.in_(bom_solution_log_sub)).subquery('solution_log')
    # bom_main_waiting_presale = sess.query(Bom_Main,bom_solution_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "WAITING",or_(Bom_Main.presale_id.in_(user_in_order), Bom_Main.create_by.in_(user_in_order)))).all()
    bom_main_waiting_presale = sess.query(Bom_Main,bom_solution_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "WAITING",Bom_Main.presale_id.in_(user_in_order))).all()
    for id in bom_main_waiting_presale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_waiting.append(bom_dict)

    # -----------------------------------------------------------------------------  presale approve
    bom_report_approve = []
    # bom_main_approve_presale = sess.query(Bom_Main,bom_solution_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",or_(Bom_Main.presale_id.in_(user_in_order), Bom_Main.create_by.in_(user_in_order)))).all()
    bom_main_approve_presale = sess.query(Bom_Main,bom_solution_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",Bom_Main.presale_id.in_(user_in_order))).all()
    for id in bom_main_approve_presale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_approve.append(bom_dict)

    # ----------------------------------------------------------------------------- presale reject
    bom_report_reject = []
    # bom_main_reject_presale = sess.query(Bom_Main,bom_solution_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "REJECT",or_(Bom_Main.presale_id.in_(user_in_order), Bom_Main.create_by.in_(user_in_order)))).all()
    bom_main_reject_presale = sess.query(Bom_Main,bom_solution_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "REJECT",Bom_Main.presale_id.in_(user_in_order))).all()
    for id in bom_main_reject_presale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_reject.append(bom_dict)

    bom_report["waiting"] = bom_report_waiting
    bom_report["approve"] = bom_report_approve
    bom_report["reject"] = bom_report_reject
    return bom_report

def get_bom_report_bd(group_name):
    global sess
    bom_report = {}
    # ------------------------------------------------------------------------------ get bom_id
    bom_id = sess.query(Bom_BD.id_bom).filter(and_(Bom_BD.bd_name == group_name,Bom_BD.inuse == True)).subquery('bom_id')
    # ----------------------------------------------------------------------------- waiting presale approve
    bom_report_waiting = []
    bom_solution_log_sub = sess.query(func.max(Bom_Solution_Log.id).label('idlog')).group_by(Bom_Solution_Log.id_bom).subquery('solution_log_sub')
    bom_solution_log = sess.query(Bom_Solution_Log).filter(Bom_Solution_Log.id.in_(bom_solution_log_sub)).subquery('solution_log')
    bom_sale_log_sub = sess.query(func.max(Bom_Sale_Log.id).label('idlog')).group_by(Bom_Sale_Log.id_bom).subquery('sale_log_sub')
    bom_sale_log = sess.query(Bom_Sale_Log).filter(Bom_Sale_Log.id.in_(bom_sale_log_sub)).subquery('sale_log')
    bom_bd_log_sub = sess.query(func.max(Bom_BD_Log.id).label('idlog')).filter((Bom_BD_Log.bd_name == group_name)).group_by(Bom_BD_Log.id_bom).subquery('bd_log_sub')
    bom_bd_log = sess.query(Bom_BD_Log).filter(Bom_BD_Log.id.in_(bom_bd_log_sub)).subquery('bd_log')
    # bom_main_waiting_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).outerjoin(bom_bd_log,(Bom_Main.id == bom_bd_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",bom_bd_log.c.case_log == "WAITING",bom_sale_log.c.case_log == "WAITING",Bom_Main.id.in_(bom_id))).all()
    bom_main_waiting_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log,bom_bd_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).outerjoin(bom_bd_log,(Bom_Main.id == bom_bd_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",bom_bd_log.c.case_log != "REJECT",bom_sale_log.c.case_log == "WAITING",Bom_Main.id.in_(bom_id))).all()
    for id in bom_main_waiting_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remar k"] = ''
        bom_report_waiting.append(bom_dict)

    # -----------------------------------------------------------------------------  presale approve
    bom_report_approve = []
    # bom_main_approve_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).outerjoin(bom_bd_log,(Bom_Main.id == bom_bd_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",or_(bom_bd_log.c.case_log == "APPROVE",bom_sale_log.c.case_log == "APPROVE"),Bom_Main.id.in_(bom_id))).all()
    bom_main_approve_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log,bom_bd_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).outerjoin(bom_bd_log,(Bom_Main.id == bom_bd_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",bom_sale_log.c.case_log == "APPROVE",Bom_Main.id.in_(bom_id))).all()
    for id in bom_main_approve_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_approve.append(bom_dict)

    # ----------------------------------------------------------------------------- presale reject
    bom_report_reject = []
    bom_main_reject_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log,bom_bd_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).outerjoin(bom_bd_log,(Bom_Main.id == bom_bd_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",or_(bom_bd_log.c.case_log == "REJECT",bom_sale_log.c.case_log == "REJECT"),Bom_Main.id.in_(bom_id))).all()
    for id in bom_main_reject_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_reject.append(bom_dict)

    bom_report["waiting"] = bom_report_waiting
    bom_report["approve"] = bom_report_approve
    bom_report["reject"] = bom_report_reject
    return bom_report

def get_bom_report_cost():
    global sess
    bom_report = {}
    # ------------------------------------------------------------------------------ get bom_id
    bom_id = sess.query(Bom_BD.id_bom).outerjoin(BD, Bom_BD.id_bd == BD.id).filter(and_(BD.type == "JV",Bom_BD.inuse == True)).subquery('bom_id')
    # ----------------------------------------------------------------------------- waiting presale approve
    bom_report_waiting = []
    bom_solution_log_sub = sess.query(func.max(Bom_Solution_Log.id).label('idlog')).group_by(Bom_Solution_Log.id_bom).subquery('solution_log_sub')
    bom_solution_log = sess.query(Bom_Solution_Log).filter(Bom_Solution_Log.id.in_(bom_solution_log_sub)).subquery('solution_log')
    bom_sale_log_sub = sess.query(func.max(Bom_Sale_Log.id).label('idlog')).group_by(Bom_Sale_Log.id_bom).subquery('sale_log_sub')
    bom_sale_log = sess.query(Bom_Sale_Log).filter(Bom_Sale_Log.id.in_(bom_sale_log_sub)).subquery('sale_log')
    bom_bd_log_sub = sess.query(func.max(Bom_BD_Log.id).label('idlog')).outerjoin(BD,(Bom_BD_Log.bd_name == BD.name)).filter((BD.type == 'JV')).group_by(Bom_BD_Log.id_bom).subquery('bd_log_sub')
    bom_bd_log = sess.query(Bom_BD_Log).filter(Bom_BD_Log.id.in_(bom_bd_log_sub)).subquery('bd_log')
    # bom_main_waiting_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",bom_sale_log.c.case_log == "WAITING",Bom_Main.id.in_(bom_id))).all()
    bom_main_waiting_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log,bom_bd_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).outerjoin(bom_bd_log,(Bom_Main.id == bom_bd_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",bom_bd_log.c.case_log != "REJECT",bom_sale_log.c.case_log == "WAITING",Bom_Main.id.in_(bom_id))).all()
    for id in bom_main_waiting_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_waiting.append(bom_dict)

    # -----------------------------------------------------------------------------  presale approve
    bom_report_approve = []
    # bom_main_approve_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",bom_sale_log.c.case_log == "APPROVE",Bom_Main.id.in_(bom_id))).all()
    bom_main_approve_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log,bom_bd_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).outerjoin(bom_bd_log,(Bom_Main.id == bom_bd_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",bom_sale_log.c.case_log == "APPROVE",Bom_Main.id.in_(bom_id))).all()
    for id in bom_main_approve_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_approve.append(bom_dict)

    # ----------------------------------------------------------------------------- presale reject
    bom_report_reject = []
    # bom_main_reject_presale = sess.query(Bom_Main,bom_solution_log,bom_sale_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",bom_sale_log.c.case_log == "REJECT",Bom_Main.id.in_(bom_id))).all()
    bom_main_reject_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log,bom_bd_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).outerjoin(bom_bd_log,(Bom_Main.id == bom_bd_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE",or_(bom_bd_log.c.case_log == "REJECT",bom_sale_log.c.case_log == "REJECT"),Bom_Main.id.in_(bom_id))).all()
    for id in bom_main_reject_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_reject.append(bom_dict)

    bom_report["waiting"] = bom_report_waiting
    bom_report["approve"] = bom_report_approve
    bom_report["reject"] = bom_report_reject
    return bom_report

def get_bom_report_admin():
    global sess
    bom_report = {}
    # ----------------------------------------------------------------------------- waiting presale approve
    bom_report_waiting = []
    bom_solution_log_sub = sess.query(func.max(Bom_Solution_Log.id).label('idlog')).group_by(Bom_Solution_Log.id_bom).subquery('solution_log_sub')
    bom_solution_log = sess.query(Bom_Solution_Log).filter(Bom_Solution_Log.id.in_(bom_solution_log_sub)).subquery('solution_log')
    bom_main_waiting_presale = sess.query(Bom_Main,bom_solution_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).filter(bom_solution_log.c.case_log == "WAITING").all()
    for id in bom_main_waiting_presale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = 'Waiting Team Lead approve'
        bom_report_waiting.append(bom_dict)
    bom_sale_log_sub = sess.query(func.max(Bom_Sale_Log.id).label('idlog')).group_by(Bom_Sale_Log.id_bom).subquery('sale_log_sub')
    bom_sale_log = sess.query(Bom_Sale_Log).filter(Bom_Sale_Log.id.in_(bom_sale_log_sub)).subquery('sale_log')
    bom_main_waiting_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE", bom_sale_log.c.case_log == "WAITING")).all()
    for id in bom_main_waiting_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_waiting.append(bom_dict)

    # -----------------------------------------------------------------------------  sale approve
    bom_report_approve = []
    bom_sale_log_sub = sess.query(func.max(Bom_Sale_Log.id).label('idlog')).group_by(Bom_Sale_Log.id_bom).subquery('sale_log_sub')
    bom_sale_log = sess.query(Bom_Sale_Log).filter(Bom_Sale_Log.id.in_(bom_sale_log_sub)).subquery('sale_log')
    bom_main_approve_sale = sess.query(Bom_Main,bom_sale_log).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(bom_sale_log.c.case_log == "APPROVE").all()
    for id in bom_main_approve_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_approve.append(bom_dict)

    # ----------------------------------------------------------------------------- presale reject
    bom_report_reject = []
    bom_solution_log_sub = sess.query(func.max(Bom_Solution_Log.id).label('idlog')).group_by(Bom_Solution_Log.id_bom).subquery('solution_log_sub')
    bom_solution_log = sess.query(Bom_Solution_Log).filter(Bom_Solution_Log.id.in_(bom_solution_log_sub)).subquery('solution_log')
    bom_main_reject_presale = sess.query(Bom_Main,bom_solution_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).filter(bom_solution_log.c.case_log == "REJECT").all()
    for id in bom_main_reject_presale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = 'Team Lead reject'
        bom_report_reject.append(bom_dict)
    bom_sale_log_sub = sess.query(func.max(Bom_Sale_Log.id).label('idlog')).group_by(Bom_Sale_Log.id_bom).subquery('sale_log_sub')
    bom_sale_log = sess.query(Bom_Sale_Log).filter(Bom_Sale_Log.id.in_(bom_sale_log_sub)).subquery('sale_log')
    bom_main_reject_sale = sess.query(Bom_Main,bom_solution_log,bom_sale_log).outerjoin(bom_solution_log,(Bom_Main.id == bom_solution_log.c.id_bom)).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(bom_solution_log.c.case_log == "APPROVE", bom_sale_log.c.case_log == "REJECT")).all()
    for id in bom_main_reject_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_reject.append(bom_dict)

    bom_report["waiting"] = bom_report_waiting
    bom_report["approve"] = bom_report_approve
    bom_report["reject"] = bom_report_reject
    return bom_report

def get_bom_report_sale(user_id):
    global sess
    bom_report = {}
    # ----------------------------------------------------------------------------- waiting presale approve
    bom_report_waiting = []
    bom_sale_log_sub = sess.query(func.max(Bom_Sale_Log.id).label('idlog')).group_by(Bom_Sale_Log.id_bom).subquery('sale_log_sub')
    bom_sale_log = sess.query(Bom_Sale_Log).filter(Bom_Sale_Log.id.in_(bom_sale_log_sub)).subquery('sale_log')
    bom_main_waiting_sale = sess.query(Bom_Main,bom_sale_log).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(bom_sale_log.c.case_log == "WAITING",Bom_Main.sale_id == user_id)).all()
    for bom in bom_main_waiting_sale:
        bom_dict = {}
        bom_dict = helper.serialize(bom.Bom_Main)
        bom_bl_id = sess.query(func.max(Bom_BD_Log.id).label('idlog')).filter((Bom_BD_Log.id_bom == bom_dict['id'])).group_by(Bom_BD_Log.bd_name).subquery('id_log')
        bom_bl = sess.query(Bom_BD_Log).filter((Bom_BD_Log.id.in_(bom_bl_id))).subquery('bom_bl')
        get_status_bd = sess.query(Bom_BD,bom_bl).outerjoin(bom_bl,(Bom_BD.bd_name == bom_bl.c.bd_name)).filter(and_(Bom_BD.inuse == True, Bom_BD.id_bom == bom_dict['id'])).all()
        count_bd_approve = 0
        count_bd = 0
        for status in get_status_bd:
            count_bd = count_bd + 1
            if status.case_log == 'APPROVE':
                count_bd_approve = count_bd_approve + 1
        if count_bd_approve == count_bd:
            bom_dict["idlog"] = bom.id
            bom_dict["case_log"] = bom.case_log
            bom_dict["log_create_date"] = bom.create_date
            bom_dict["remark"] = ''
            bom_report_waiting.append(bom_dict)

    # -----------------------------------------------------------------------------  presale approve
    bom_report_approve = []
    bom_main_approve_sale = sess.query(Bom_Main,bom_sale_log).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(bom_sale_log.c.case_log == "APPROVE",Bom_Main.sale_id == user_id)).all()
    for id in bom_main_approve_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_approve.append(bom_dict)

    # ----------------------------------------------------------------------------- presale reject
    bom_report_reject = []
    bom_main_reject_sale = sess.query(Bom_Main,bom_sale_log).outerjoin(bom_sale_log,(Bom_Main.id == bom_sale_log.c.id_bom)).filter(and_(bom_sale_log.c.case_log == "REJECT",Bom_Main.sale_id == user_id)).all()
    for id in bom_main_reject_sale:
        bom_dict = {}
        bom_dict = helper.serialize(id.Bom_Main)
        bom_dict["idlog"] = id.id
        bom_dict["case_log"] = id.case_log
        bom_dict["log_create_date"] = id.create_date
        bom_dict["remark"] = ''
        bom_report_reject.append(bom_dict)

    bom_report["waiting"] = bom_report_waiting
    bom_report["approve"] = bom_report_approve
    bom_report["reject"] = bom_report_reject
    return bom_report

@authener.check_token("user")
def getReportBoms(role_user,user_id,user_level):
    global sess
    try:
        if (role_user == "presale" or role_user == "leadpresale"):
            user_in_order = []
            user_relation = sess.query(User_Relation.id_group,User_Relation.level).outerjoin(User,(User_Relation.id_user == User.id)).filter(and_(User_Relation.id_user == user_id, User_Relation.inuse == True)).first()
            user_id_l1 = sess.query(User_Relation,User).outerjoin(User,(User_Relation.id_user == User.id)).filter(and_(User_Relation.id_user != user_id,User_Relation.level < user_relation.level, User_Relation.id_group == user_relation.id_group, User_Relation.inuse == True)).all()
            for id in user_id_l1:
                id_user = helper.serialize(id.User_Relation)
                user_in_order.append(id_user['id_user'])
            group_relation = sess.query(User_Group_Relation).filter(User_Group_Relation.id_group == user_relation.id_group).all()
            for group_id in group_relation:
                id_group = helper.serialize(group_id)
                user_id_l2 = sess.query(User_Relation,User).outerjoin(User,(User_Relation.id_user == User.id)).filter(and_(User_Relation.id_group == id_group['id_group_child'], User_Relation.inuse == True)).all()
                for id in user_id_l2:
                    id_user = helper.serialize(id.User_Relation)
                    user_in_order.append(id_user['id_user'])

            if len(user_in_order) == 0:
                bom_report = get_bom_report_presale(user_id)
                return json_response({"bom_report": bom_report},200)
            else:
                bom_report = get_bom_report_lead_presale(user_id,user_in_order)
                return json_response({"bom_report": bom_report},200)
        elif (role_user == "bd"):
            user_relation = sess.query(User_Relation.id_group).filter(User_Relation.id_user == user_id).first()
            group_name = sess.query(User_Group.name).filter(User_Group.id == user_relation.id_group).first()
            bom_report = get_bom_report_bd(group_name.name)
            return json_response({"bom_report": bom_report},200)
        elif (role_user == "cost"):
            bom_report = get_bom_report_cost()
            return json_response({"bom_report": bom_report},200)
        elif (role_user == "admin"):
            bom_report = get_bom_report_admin()
            return json_response({"bom_report": bom_report},200)
        elif (role_user == "sale"):
            bom_report = get_bom_report_sale(user_id)
            return json_response({"bom_report": bom_report},200)
        else:
            return json_response({"message": "Have not type user"},400)
    except IntegrityError as e:
        print 'error api get report all bom', e
        return json_response({"message": e.message},400)

def savediagram(diagram,id_bom):
    diagram_path = []
    try:
        for img in diagram:
            path = os.getcwd() + '/apps/boms/diagram/bomid-' + str(id_bom)
            if not os.path.exists(path):
                os.makedirs(path)
            # timenow = (datetime.datetime.utcnow() + datetime.timedelta(hours=7)).strftime("%Y-%m-%d-%H-%M-%S")
            print img
            image = img['img_name'].split("-")
            path = os.getcwd() + '/apps/boms/diagram/bomid-' + str(id_bom) + '/' + str(id_bom) + '-' + image[len(image) - 1]
            print path, '**********'
            img_name = str(id_bom) + '-' + image[len(image) - 1]
            fh = open(path, "wb")
            fh.write(img['base64'].decode('base64'))
            fh.close()
            # or, more concisely using with statement
            # with open(os.getcwd() + '/apps/boms/diagram/' + img['name'], "wb") as fh:
            #     fh.write(img['base64textString'].decode('base64'))'
            diagram_path.append({'path': path,'name': img_name})
        print '-------> ',diagram_path
        return True,diagram_path
    except Exception as e:
        print 'error binary: ', e
        return False,diagram

def savefile(file,id_bom):
    file_path = []
    try:
        for f in file:
            path = os.getcwd() + '/apps/boms/ref_file/bomid-' + str(id_bom)
            if not os.path.exists(path):
                os.makedirs(path)
            timenow = (datetime.datetime.utcnow() + datetime.timedelta(hours=7)).strftime("%Y-%m-%d-%H-%M-%S")
            image = f['file_name'].split("-")
            path = os.getcwd() + '/apps/boms/ref_file/bomid-' + str(id_bom) + '/' + str(id_bom) + '-' + str(timenow) + '-' + image[len(image) - 1]
            print path, '**********'
            file_name = str(id_bom) + '-' + str(timenow) + '-' + image[len(image) - 1]
            fh = open(path, "wb")
            fh.write(f['base64'].decode('base64'))
            fh.close()
            file_path.append({'path': path,'name': file_name})
        print '-------> ',file_path
        return True,file_path
    except Exception as e:
        print 'error binary: ', e
        return False,file_path

def getdiagram(path):
    encoded_string = ''
    with open(path, "rb") as image_file:
        encoded_string = base64.b64encode(image_file.read())
    if encoded_string == '':
        return False,encoded_string
    else:
        return True,encoded_string

@authener.check_token("user")
def createBom():
    global sess
    data = request.json
    data_create = data['document_bom']
    parameter_check = ["project_name","sale_id","sale_name","sale_tel","presale_id","presale_name","presale_tel",
        "contract","bom_item","total_sale_price","total_actualcost","total_engcost","total_engcost_month",
        "sale_factor","create_by","bom_bd","cust_name","remark","diagram","vm_resource", "ref_file"]
    _,missing_key = check_parameter(data_create.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        new_bom = Bom_Main(
            project_name = data_create.get("project_name", None),
            customer_id = '',
            customer_name = data_create.get("cust_name", None),
            sale_id = data_create.get("sale_id", None),
            sale_name = data_create.get("sale_name", None),
            sale_tel = data_create.get("sale_tel", None),
            presale_id = data_create.get("presale_id", None),
            presale_name = data_create.get("presale_name", None),
            presale_tel = data_create.get("presale_tel", None),
            contract = data_create.get("contract", None),
            total_sale_price = data_create.get("total_sale_price", None),
            total_actualcost = data_create.get("total_actualcost", None),
            total_engcost = data_create.get("total_engcost", None),
            total_engcost_per_month = data_create.get("total_engcost_month", None),
            sale_factor = data_create.get("sale_factor", None),
            create_by = data_create.get("create_by", None),
            create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
            version = '1.01',
            inuse = True,
            ref_type = '',
            ref_id = ''
        )
        sess.add(new_bom)
        bom_id = sess.query(Bom_Main).filter((Bom_Main.project_name==data_create["project_name"])).order_by((Bom_Main.id).desc()).limit(1)
        id_bom = []
        for id in bom_id:
            bom_dict = helper.serialize(id)
            id_bom.append(bom_dict)
        if id_bom != None:
            # create log bom main
            new_bom_log = Bom_Log(
                id_bom = id_bom[0]["id"],
                case_log = "CREATE",
                version = '1.01',
                data_change = '',
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create.get("create_by", None),
                remark = data_create['remark']
            )
            sess.add(new_bom_log)

            new_bom_sale_log = Bom_Sale_Log(
                id_bom = id_bom[0]["id"],
                case_log = "WAITING",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create.get("create_by", None)
            )
            sess.add(new_bom_sale_log)

            new_bom_solution_log = Bom_Solution_Log(
                id_bom = id_bom[0]["id"],
                case_log = "WAITING",
                create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                create_by = data_create.get("create_by", None)
            )
            sess.add(new_bom_solution_log)

            for data_item in data_create["bom_bd"]:
                new_bom_bd = Bom_BD(
                    id_bom = id_bom[0]["id"],
                    id_bd = data_item['bd_id'],
                    bd_name = data_item['bd_name'],
                    inuse = True
                )
                sess.add(new_bom_bd)

                new_bom_bd_log = Bom_BD_Log(
                    id_bom = id_bom[0]["id"],
                    bd_name = data_item['bd_name'],
                    case_log = "WAITING",
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data_create.get("create_by", None)
                )
                sess.add(new_bom_bd_log)

            for data_item in data_create['bom_item']:
                new_bom_item = Bom_Item(
                    id_bom = id_bom[0]["id"],
                    id_bd = data_item['bd_id'],
                    bd_name = data_item['bd_name'],
                    id_product = data_item['product_id'],
                    product_name = data_item['product_name'],
                    id_item = int(data_item['item_id']),
                    item_name = data_item['item_name'],
                    inuse = True
                )
                sess.add(new_bom_item)

                bom_item_id = sess.query(Bom_Item).filter((Bom_Item.id_bom==id_bom[0]["id"]) , (Bom_Item.item_name == data_item["item_name"]) , (Bom_Item.inuse == True)).order_by((Bom_Item.id).desc()).limit(1)
                id_bom_item = []
                for id in bom_item_id:
                    bom_item_dict = helper.serialize(id)
                    id_bom_item.append(bom_item_dict)

                new_bom_item_price = Bom_Item_Price(
                    id_bom_item = id_bom_item[0]['id'],
                    item_ratio_engcost = data_item['ratio_engcost'],
                    item_unit_amount = data_item['amount_unit'],
                    item_unit =  data_item['units'],
                    item_unit_price = data_item['price_unit'],
                    item_amount_price = data_item['price'],
                    item_actualcost = data_item['actualcost'],
                    item_ratio_actualcost = data_item['ratio_actualcost'],
                    item_engcost = data_item['engcost'],
                    item_engcost_month = data_item['engcost_per_month'],
                    onetime = data_item['onetime'],
                    inuse = True
                )
                sess.add(new_bom_item_price)

                bom_item_price_id = sess.query(Bom_Item_Price).filter((Bom_Item_Price.id_bom_item == id_bom_item[0]['id']), (Bom_Item_Price.inuse == True)).order_by((Bom_Item_Price.id).desc()).limit(1)
                id_bom_item_price = []
                for id in bom_item_price_id:
                    bom_item_price_dict = helper.serialize(id)
                    id_bom_item_price.append(bom_item_price_dict)

            check_img,diagram = savediagram(data_create['diagram'],id_bom[0]["id"])
            # if (check_img):
            #     for i in diagram:
            #         new_diagram = Bom_Diagram(
            #             id_bom = id_bom[0]['id'],
            #             path = i['path'],
            #             img_name = i['name'],
            #             inuse = True
            #         )
            #         sess.add(new_diagram)
            # else:
            #     sess.rollback()
            #     return json_response({"message": "can't save diagram"},400)

            check_file,file = savefile(data_create['diagram'],id_bom[0]["id"])
            # if (check_file):
            #     for i in file:
            #         new_file = Bom_Ref_File(
            #             id_bom = id_bom[0]['id'],
            #             path = i['path'],
            #             file_name = i['name'],
            #             file_type = i['type'],
            #             inuse = True
            #         )
            #         sess.add(new_file)
            # else:
            #     sess.rollback()
            #     return json_response({"message": "can't save diagram"},400)

            for data in data_create["vm_resource"]:
                new_vm_resource = Bom_VM_Resource(
                    id_bom = id_bom[0]["id"],
                    name_server = data['name_server'],
                    cpu = data['cpu'],
                    memory = data['memory'],
                    disk = data['disk'],
                    os = data['os'],
                    sql = data['sql'],
                    additional = data['additional'],
                    inuse = True
                )
                sess.add(new_vm_resource)
            sess.commit()
            return json_response({"message": "Create Complete", "status": 'success'},200)
        else:
            sess.rollback()
            return json_response({"message": "can't get bom id"},400)
    except Exception as e:
        print 'error api create bom: ' ,e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("user")
def getDocumentBom(id_bom,version):
    global sess
    try:
        bom_check_ver = sess.query(Bom_Main).filter(and_(Bom_Main.id == id_bom, Bom_Main.version == version, Bom_Main.inuse == True)).all()
        if len(bom_check_ver):
            id_item_price = []
            get_bom_main = sess.query(Bom_Main).filter(and_(Bom_Main.id==id_bom, Bom_Main.inuse == True)).all()
            bom_document = []
            for document_main in get_bom_main:
                bom_dict = helper.serialize(document_main)

                get_bom_bd = sess.query(Bom_BD).filter(and_(Bom_BD.id_bom==id_bom, Bom_BD.inuse == True)).all()
                bom_dict["bd"] = []
                for document_bd in get_bom_bd:
                    bom_bd_dict = helper.serialize(document_bd)
                    bom_dict["bd"].append(bom_bd_dict)

                get_bom_item = sess.query(Bom_Item,BD.type).outerjoin(BD,(Bom_Item.id_bd == BD.id)).filter(and_(Bom_Item.id_bom==id_bom, Bom_Item.inuse == True)).all()
                bom_dict["item"] = []
                for document_item in get_bom_item:
                    bom_item_dict = helper.serialize(document_item.Bom_Item)
                    bom_item_dict['type'] = document_item.type
                    get_bom_item_price = sess.query(Bom_Item_Price).filter(and_(Bom_Item_Price.id_bom_item==bom_item_dict["id"], Bom_Item_Price.inuse == True)).all()
                    for document_item_price in get_bom_item_price:
                        bom_item_price_dict = helper.serialize(document_item_price)
                        id_item_price.append(bom_item_price_dict["id"])
                        bom_item_dict["ratio_engcost"] = bom_item_price_dict["item_ratio_engcost"]
                        bom_item_dict["unit_amount"] = bom_item_price_dict["item_unit_amount"]
                        bom_item_dict["unit"] = bom_item_price_dict["item_unit"]
                        bom_item_dict["unit_price"] = bom_item_price_dict["item_unit_price"]
                        bom_item_dict["amount_price"] = bom_item_price_dict["item_amount_price"]
                        bom_item_dict["actualcost"] = bom_item_price_dict["item_actualcost"]
                        bom_item_dict["ratio_actualcost"] = bom_item_price_dict["item_ratio_actualcost"]
                        bom_item_dict["engcost"] = bom_item_price_dict["item_engcost"]
                        bom_item_dict["engcost_month"] = bom_item_price_dict["item_engcost_month"]
                        bom_item_dict["onetime"] = bom_item_price_dict["onetime"]
                    bom_dict["item"].append(bom_item_dict)

                get_diagram = sess.query(Bom_Diagram).filter(and_(Bom_Diagram.id_bom == id_bom, Bom_Diagram.inuse == True)).all()
                bom_dict['diagram'] = []
                for diagram in get_diagram:
                    diagram_dict = helper.serialize(diagram)
                    check,base64 = getdiagram(diagram_dict['path'])
                    if check:
                        diagram_base64 = {}
                        diagram_dict['base64'] = base64
                        diagram_base64['base64'] = base64
                        diagram_base64['img_name'] = diagram_dict['img_name']
                        bom_dict['diagram'].append(diagram_base64)
                    else:
                        json_response({"message": 'error get diagram'},400)

                get_vm_resource = sess.query(Bom_VM_Resource).filter(and_(Bom_VM_Resource.id_bom == id_bom, Bom_VM_Resource.inuse == True)).all()
                bom_dict['vm_resource'] = []
                for vm_resource in get_vm_resource:
                    dict = helper.serialize(vm_resource)
                    bom_dict['vm_resource'].append(dict)
                bom_document.append(bom_dict)

            bom_all_log = []
            get_main_log = sess.query(Bom_Log,User.username).outerjoin(User,(Bom_Log.create_by == User.id)).filter(and_(Bom_Log.id_bom == id_bom)).all()
            for log in get_main_log:
                log_dict = helper.serialize(log.Bom_Log)
                log_dict['role'] = 'bd,cost or presale'
                log_dict['username'] = log.username
                bom_all_log.append(log_dict)
            check_sale_approve = False
            bom_sale_approve = sess.query(Bom_Sale_Log).filter((Bom_Sale_Log.id_bom == id_bom)).order_by((Bom_Sale_Log.id).desc()).first()
            if bom_sale_approve.case_log == 'APPROVE':
                check_sale_approve = True

            bsl_l1 = sess.query(func.max(Bom_Sale_Log.id).label('idlog')).filter((Bom_Sale_Log.id_bom == id_bom)).subquery('id_sale_log')
            bsl_l2 = sess.query(Bom_Sale_Log).filter((Bom_Sale_Log.id.in_(bsl_l1))).first()
            remark_reject = []
            if bsl_l2.remark != None and bsl_l2.case_log == 'REJECT':
                if bsl_l2.remark.strip() != '':
                    remark_reject.append('sale comment: ' + bsl_l2.remark)
            bll_l1 = sess.query(func.max(Bom_Solution_Log.id).label('idlog')).filter((Bom_Solution_Log.id_bom == id_bom)).subquery('id_solution_log')
            bll_l2 = sess.query(Bom_Solution_Log).filter((Bom_Solution_Log.id.in_(bll_l1))).first()
            if bll_l2.remark != None and bll_l2.case_log == 'REJECT':
                if bll_l2.remark.strip() != '':
                    remark_reject.append('lead presale comment: ' + bll_l2.remark)
            bom_bd = sess.query(Bom_BD.bd_name).filter((Bom_BD.id_bom == id_bom)).subquery('bd')
            bbl_l1 = sess.query(func.max(Bom_BD_Log.id).label('idlog')).filter(and_(Bom_BD_Log.id_bom == id_bom, Bom_BD_Log.bd_name.in_(bom_bd))).group_by(Bom_BD_Log.bd_name).subquery('id_bd_log')
            bbl_l2 = sess.query(Bom_BD_Log,BD).outerjoin(BD,(Bom_BD_Log.bd_name == BD.name)).filter((Bom_BD_Log.id.in_(bbl_l1))).all()
            check_jv = True
            for log in bbl_l2:
                log_dict = helper.serialize(log.Bom_BD_Log)
                bd_type = helper.serialize(log.BD)
                if log_dict['remark'] != None and log_dict['case_log'] == 'REJECT':
                    if log_dict['remark'].strip() != '':
                        print 'bd type: ', bd_type['type'], ' bd name: ', log_dict['bd_name']
                        if bd_type['type'].strip() == 'JV' and check_jv:
                            check_jv = False
                            remark_reject.append('cost comment: ' + log_dict['remark'])
                        elif bd_type['type'].strip() == 'INET':
                            remark_reject.append('bd: ' + log_dict['bd_name'] + ' comment: ' + log_dict['remark'])
            return json_response({"document": bom_document, "document_log": bom_all_log, "check_sale_approve": check_sale_approve, "reject_comment": remark_reject},200)
        else:
            id_item_price = []
            get_bom_main_old = sess.query(Bom_Main_Old).filter(and_(Bom_Main_Old.id_bom_main == id_bom, Bom_Main_Old.version == version)).all()
            bom_document = []
            for document_old in get_bom_main_old:
                bom_dict = helper.serialize(document_old)

                get_bom_bd_old = sess.query(Bom_BD_Old).filter(and_(Bom_BD_Old.id_bom_old==bom_dict['id'], Bom_BD_Old.inuse == True)).all()
                bom_dict["bd"] = []
                for document_bd in get_bom_bd_old:
                    bom_bd_dict = helper.serialize(document_bd)
                    bom_dict["bd"].append(bom_bd_dict)

                get_bom_item_old = sess.query(Bom_Item_Old,BD.type).outerjoin(BD,(Bom_Item_Old.id_bd == BD.id)).filter(and_(Bom_Item_Old.id_bom_old==bom_dict['id'], Bom_Item_Old.inuse == True)).all()
                bom_dict["item"] = []
                for document_item in get_bom_item_old:
                    bom_item_dict = helper.serialize(document_item.Bom_Item_Old)
                    bom_item_dict['type'] = document_item.type
                    get_bom_item_price = sess.query(Bom_Item_Price_Old).filter(and_(Bom_Item_Price_Old.id_bom_item==bom_item_dict["id"], Bom_Item_Price_Old.inuse == True)).all()
                    for document_item_price in get_bom_item_price:
                        bom_item_price_dict = helper.serialize(document_item_price)
                        id_item_price.append(bom_item_price_dict["id"])
                        bom_item_dict["ratio_engcost"] = bom_item_price_dict["item_ratio_engcost"]
                        bom_item_dict["unit_amount"] = bom_item_price_dict["item_unit_amount"]
                        bom_item_dict["unit"] = bom_item_price_dict["item_unit"]
                        bom_item_dict["unit_price"] = bom_item_price_dict["item_unit_price"]
                        bom_item_dict["amount_price"] = bom_item_price_dict["item_amount_price"]
                        bom_item_dict["actualcost"] = bom_item_price_dict["item_actualcost"]
                        bom_item_dict["ratio_actualcost"] = bom_item_price_dict["item_ratio_actualcost"]
                        bom_item_dict["engcost"] = bom_item_price_dict["item_engcost"]
                        bom_item_dict["engcost_month"] = bom_item_price_dict["item_engcost_month"]
                        bom_item_dict["onetime"] = bom_item_price_dict["onetime"]
                    bom_dict["item"].append(bom_item_dict)

                get_diagram = sess.query(Bom_Diagram_Old).filter((Bom_Diagram.id_bom_old == bom_dict['id'])).all()
                bom_dict['diagram'] = []
                for diagram in get_diagram:
                    diagram_dict = helper.serialize(diagram)
                    check,base64 = getdiagram(diagram_dict['path'])
                    if check:
                        diagram_dict['base64'] = base64
                        bom_dict['diagram'].append(diagram_dict)
                    else:
                        json_response({"message": 'error get diagram'},400)
                bom_document.append(bom_dict)

            check_sale_approve = False
            bom_sale_approve = sess.query(Bom_Sale_Log).filter((Bom_Sale_Log.id_bom == id_bom)).order_by((Bom_Sale_Log.id).desc()).first()
            if bom_sale_approve.case_log == 'APPROVE':
                check_sale_approve = True

            return json_response({"document": bom_document, "check_sale_approve": check_sale_approve},200)
    except IntegrityError as e:
        print 'error get document 1 bom: ', e
        return json_response({"message": e.message},400)

def check_bd_approve ():
    global sess
    try:
        bom_main = sess.query(Bom_Main).filter((Bom_Main.ref_type == 'POC')).all()
        if len(bom_main) != 0:
            for id_bom in bom_main:
                bom_dict = helper.serialize(id_bom)
                bom_bd = sess.query(Bom_BD).filter((Bom_BD.id_bom == bom_dict['id'])).subquery('bom_bd')
                bom_bd_log_l1 = sess.query(func.max(Bom_BD_Log.id).label('idlog')).outerjoin(bom_bd,(Bom_BD_Log.bd_name == bom_bd.bd_name)).filter((Bom_BD_Log.id_bom == bom_dict['id'])).group_by(Bom_BD_Log.bd_name).subquery('bom_bd_log')
                bom_bd_log = sess.query(Bom_BD_Log).filter((Bom_BD_Log.id.in_(bom_bd_log_l1))).all()
                count_bd = 0
                count_bd_approve = 0
                for log in bom_bd_log:
                    count_bd = count_bd + 1
                    bd_log_dict = helper.serialize(log)
                    if bd_log_dict['case_log'] == 'APPROVE':
                        count_bd_approve = count_bd_approve + 1
                if count_bd == count_bd_approve:
                    id_item_price = []
                    get_bom_main = sess.query(Bom_Main).filter(and_(Bom_Main.id==bom_dict['id'], Bom_Main.inuse == True)).all()
                    bom_document = []
                    for document_main in get_bom_main:
                        bom_dict = helper.serialize(document_main)

                        get_bom_bd = sess.query(Bom_BD).filter(and_(Bom_BD.id_bom==bom_dict['id'], Bom_BD.inuse == True)).all()
                        bom_dict["bd"] = []
                        for document_bd in get_bom_bd:
                            bom_bd_dict = helper.serialize(document_bd)
                            bom_dict["bd"].append(bom_bd_dict)

                        get_bom_item = sess.query(Bom_Item,BD.type).outerjoin(BD,(Bom_Item.id_bd == BD.id)).filter(and_(Bom_Item.id_bom==bom_dict['id'], Bom_Item.inuse == True)).all()
                        bom_dict["item"] = []
                        for document_item in get_bom_item:
                            bom_item_dict = helper.serialize(document_item.Bom_Item)
                            bom_item_dict['type'] = document_item.type
                            get_bom_item_price = sess.query(Bom_Item_Price).filter(and_(Bom_Item_Price.id_bom_item==bom_item_dict["id"], Bom_Item_Price.inuse == True)).all()
                            for document_item_price in get_bom_item_price:
                                bom_item_price_dict = helper.serialize(document_item_price)
                                id_item_price.append(bom_item_price_dict["id"])
                                bom_item_dict["ratio_engcost"] = bom_item_price_dict["item_ratio_engcost"]
                                bom_item_dict["unit_amount"] = bom_item_price_dict["item_unit_amount"]
                                bom_item_dict["unit"] = bom_item_price_dict["item_unit"]
                                bom_item_dict["unit_price"] = bom_item_price_dict["item_unit_price"]
                                bom_item_dict["amount_price"] = bom_item_price_dict["item_amount_price"]
                                bom_item_dict["actualcost"] = bom_item_price_dict["item_actualcost"]
                                bom_item_dict["ratio_actualcost"] = bom_item_price_dict["item_ratio_actualcost"]
                                bom_item_dict["engcost"] = bom_item_price_dict["item_engcost"]
                                bom_item_dict["engcost_month"] = bom_item_price_dict["item_engcost_month"]
                                bom_item_dict["onetime"] = bom_item_price_dict["onetime"]
                            bom_dict["item"].append(bom_item_dict)
                        bom_document.append(bom_dict)

                    check_data = poc_fuction(bom_document)
                    if check_data['message'] == 'success':
                        try:
                            update_status = Bom_POC_Status.query.filter_by(id_bom = bom_dict['id']).update(dict(status = True, modify_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7))))
                            sess.commit()
                        except Exception as e:
                            print 'sending bom to poc', e
                            sess.rollback()
                    return True
                else:
                    return False
        return False
    except Exception as e:
        print 'error function check bd approve : ',e
        return False

@authener.check_token("user")
def approveBom():
    global sess
    data = request.json
    data_approve = data['document_approve']
    parameter_check = ["id_bom","user_id","role_user","group_name","remark"]
    _,missing_key = check_parameter(data_approve.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    if data_approve['id_bom'] != None:
        if data_approve['role_user'] == 'sale':
            try:
                new_bom_sale_log = Bom_Sale_Log(
                    id_bom = data_approve['id_bom'],
                    case_log = "APPROVE",
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data_approve['user_id'],
                    remark = data_approve['remark']
                )
                sess.add(new_bom_sale_log)
                sess.commit()
                return json_response({"message": "success"},200)
            except Exception as e:
                print 'error api approve bom role sale:', e
                sess.rollback()
                return json_response({"message": e.message},400)
        elif data_approve['role_user'] == 'leadpresale':
            try:
                new_bom_solution_log = Bom_Solution_Log(
                    id_bom = data_approve['id_bom'],
                    case_log = "APPROVE",
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data_approve['user_id'],
                    remark = data_approve['remark']
                )
                sess.add(new_bom_solution_log)
                sess.commit()
                return json_response({"message": "success"},200)
            except Exception as e:
                print 'error api approve presale: ',e
                sess.rollback()
                return json_response({"message": e.message},400)
        elif data_approve['role_user'] == 'bd':
            try:
                new_bom_bd_log = Bom_BD_Log(
                    id_bom = data_approve['id_bom'],
                    case_log = "APPROVE",
                    bd_name = data_approve['group_name'],
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data_approve['user_id'],
                    remark = data_approve['remark']
                )
                sess.add(new_bom_bd_log)

                # sending to poc i'both
                check = check_bd_approve()
                if check:
                    print 'send to poc complete'
                else:
                    print 'send to poc mistake'

                sess.commit()
                return json_response({"message": "success"},200)
            except Exception as e:
                print 'error api approve presale: ',e
                sess.rollback()
                return json_response({"message": e.message},400)
        elif data_approve['role_user'] == 'cost':
            try:
                bom_bd = sess.query(Bom_BD,BD).outerjoin(BD,(Bom_BD.id_bd == BD.id)).filter(and_(Bom_BD.id_bom == data_approve['id_bom'], Bom_BD.inuse == True, BD.type == 'JV')).all()
                for bd_in_bom in bom_bd:
                    bd_name = helper.serialize(bd_in_bom.Bom_BD)
                    new_bom_bd_log = Bom_BD_Log(
                        id_bom = data_approve['id_bom'],
                        case_log = "APPROVE",
                        bd_name = bd_name['bd_name'],
                        create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                        create_by = data_approve['user_id'],
                        remark = data_approve['remark']
                    )
                    sess.add(new_bom_bd_log)

                # sending to poc i'both
                check = check_bd_approve()
                if check:
                    print 'send to poc complete'
                else:
                    print 'send to poc mistake'

                sess.commit()
                return json_response({"message": "success"},200)
            except Exception as e:
                print 'error api approve presale: ',e
                sess.rollback()
                return json_response({"message": e.message},400)
        else:
            return json_response({"message": "can't get role user"},400)
    else:
        return json_response({"message": "can't get bom id"},400)

@authener.check_token("user")
def rejectBom():
    global sess
    data = request.json
    data_approve = data['document_reject']
    parameter_check = ["id_bom","user_id","role_user","group_name","remark"]
    _,missing_key = check_parameter(data_approve.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    if data_approve['id_bom'] != None:
        if data_approve['role_user'] == 'sale':
            try:
                new_bom_sale_log = Bom_Sale_Log(
                    id_bom = data_approve['id_bom'],
                    case_log = "REJECT",
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data_approve['user_id'],
                    remark = data_approve['remark']
                )
                sess.add(new_bom_sale_log)
                sess.commit()
                return json_response({"message": "success"},200)
            except Exception as e:
                print 'error api reject bom role sale:', e
                sess.rollback()
                return json_response({"message": e.message},400)
        # and data_approve['role_level'] > 1
        elif data_approve['role_user'] == 'leadpresale':
            try:
                new_bom_solution_log = Bom_Solution_Log(
                    id_bom = data_approve['id_bom'],
                    case_log = "REJECT",
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data_approve['user_id'],
                    remark = data_approve['remark']
                )
                sess.add(new_bom_solution_log)
                sess.commit()
                return json_response({"message": "success"},200)
            except IntegrityError as e:
                print 'error api reject bom role presale:', e
                sess.rollback()
                return json_response({"message": e.message},400)
        elif data_approve['role_user'] == 'bd':
            try:
                new_bom_bd_log = Bom_BD_Log(
                    id_bom = data_approve['id_bom'],
                    case_log = "REJECT",
                    bd_name = data_approve['group_name'],
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data_approve['user_id'],
                    remark = data_approve['remark']
                )
                sess.add(new_bom_bd_log)
                sess.commit()
                return json_response({"message": "success"},200)
            except Exception as e:
                print 'error api approve presale: ',e
                sess.rollback()
                return json_response({"message": e.message},400)
        elif data_approve['role_user'] == 'cost':
            try:
                bom_bd = sess.query(Bom_BD,BD).outerjoin(BD,(Bom_BD.id_bd == BD.id)).filter(and_(Bom_BD.id_bom == data_approve['id_bom'], Bom_BD.inuse == True, BD.type == 'JV')).all()
                for bd_in_bom in bom_bd:
                    bd_name = helper.serialize(bd_in_bom.Bom_BD)
                    new_bom_bd_log = Bom_BD_Log(
                        id_bom = data_approve['id_bom'],
                        case_log = "REJECT",
                        bd_name = bd_name['bd_name'],
                        create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                        create_by = data_approve['user_id'],
                        remark = data_approve['remark']
                    )
                    sess.add(new_bom_bd_log)
                sess.commit()
                return json_response({"message": "success"},200)
            except Exception as e:
                print 'error api approve presale: ',e
                sess.rollback()
                return json_response({"message": e.message},400)
        else:
            return json_response({"message": "can't get role user"},400)
    else:
        return json_response({"message": "can't get bom id"},400)

@authener.check_token("user")
def editBom():
    global sess
    data = request.json
    data_edit = data['document_bom']
    parameter_check = ["contract","create_by","id","inuse","item","presale_id",
        "presale_name","presale_tel","project_name","sale_factor","sale_id","sale_name",
        "sale_tel","total_actualcost","total_engcost","total_engcost_per_month","total_sale_price","version","diagram","vm_resource","bd"]
    _,missing_key = check_parameter(data_edit.keys(), parameter_check)
    if missing_key != [] : return json_response({"message": "Missing parameter: " + ",".join(missing_key)}, 400)
    try:
        if data_edit['id'] != None:
            version = data_edit['version']
            if data['role_user'] == 'presale' or data['role_user'] == 'admin':
                version = float(data_edit['version']) + 1.00# back up old version main
                version = round(version, 2)
                get_old_bom_main = sess.query(Bom_Main).filter((Bom_Main.id == data_edit["id"])).first()
                old_bom = Bom_Main_Old(
                    id_bom_main = get_old_bom_main.id,
                    project_name = get_old_bom_main.project_name,
                    customer_name = get_old_bom_main.customer_name,
                    sale_id = get_old_bom_main.sale_id,
                    sale_name = get_old_bom_main.sale_name,
                    sale_tel = get_old_bom_main.sale_tel,
                    presale_id = get_old_bom_main.presale_id,
                    presale_name = get_old_bom_main.presale_name,
                    presale_tel =get_old_bom_main.presale_tel,
                    contract = get_old_bom_main.contract,
                    total_sale_price = get_old_bom_main.total_sale_price,
                    total_actualcost = get_old_bom_main.total_actualcost,
                    total_engcost = get_old_bom_main.total_engcost,
                    total_engcost_per_month = get_old_bom_main.total_engcost_per_month,
                    sale_factor = get_old_bom_main.sale_factor,
                    create_by = get_old_bom_main.create_by,
                    create_date = get_old_bom_main.create_date,
                    version = get_old_bom_main.version,
                    inuse = True
                )
                sess.add(old_bom)

                # update new version and create log
                update_main = Bom_Main.query.filter_by(id = data_edit["id"]).update(
                    dict(
                        contract = data_edit['contract'],total_sale_price = data_edit['total_sale_price'],
                        total_actualcost = data_edit['total_actualcost'],total_engcost = data_edit['total_engcost'],
                        total_engcost_per_month = data_edit['total_engcost_per_month'],sale_factor = data_edit['sale_factor'],
                        version = version, ref_type = '', ref_id = ''
                    )
                )
                new_bom_log = Bom_Log(
                    id_bom = data_edit["id"],
                    case_log = "EDIT",
                    version = data_edit['version'],
                    data_change = data['check_change'],
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data["user_id"],
                    remark = data['remark']
                )
                sess.add(new_bom_log)
                new_bom_sale_log = Bom_Sale_Log(
                    id_bom = data_edit["id"],
                    case_log = "WAITING",
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data["user_id"]
                )
                sess.add(new_bom_sale_log)
                new_bom_solution_log = Bom_Solution_Log(
                    id_bom = data_edit["id"],
                    case_log = "WAITING",
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data["user_id"]
                )
                sess.add(new_bom_solution_log)
                # id old bom main
                get_id_bom_old = sess.query(Bom_Main_Old).order_by((Bom_Main_Old.id).desc()).first()

                # back up old version bd
                get_old_bom_bd = sess.query(Bom_BD).filter(and_(Bom_BD.id_bom == data_edit["id"],Bom_BD.inuse == True)).all()
                for bd_old in get_old_bom_bd:
                    bom_bd_value = helper.serialize(bd_old)
                    new_bom_bd_old = Bom_BD_Old(
                        id_bom_old = get_id_bom_old.id,
                        id_bd = bom_bd_value['id_bd'],
                        bd_name = bom_bd_value['bd_name'],
                        inuse = True
                    )
                    sess.add(new_bom_bd_old)
                delete_bd = Bom_BD.query.filter_by(id_bom = data_edit['id']).delete()
                for data_item in data_edit["bd"]:
                    new_bom_bd = Bom_BD(
                        id_bom = data_edit["id"],
                        id_bd = data_item['bd_id'],
                        bd_name = data_item['bd_name'],
                        inuse = True
                    )
                    sess.add(new_bom_bd)
                    new_bom_bd_log = Bom_BD_Log(
                        id_bom = data_edit["id"],
                        bd_name = data_item['bd_name'],
                        case_log = "WAITING",
                        create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                        create_by = data["user_id"]
                    )
                    sess.add(new_bom_bd_log)

                # bacl up item
                get_old_bom_item = sess.query(Bom_Item).filter(and_(Bom_Item.id_bom == data_edit["id"],Bom_Item.inuse == True)).all()
                for item_old in get_old_bom_item:
                    bom_item_value = helper.serialize(item_old)
                    new_bom_item_old = Bom_Item_Old(
                        id_bom_old = get_id_bom_old.id,
                        id_bd = bom_item_value['id_bd'],
                        bd_name = bom_item_value['bd_name'],
                        id_product = bom_item_value['id_product'],
                        product_name = bom_item_value['product_name'],
                        id_item = bom_item_value['id_item'],
                        item_name = bom_item_value['item_name'],
                        inuse = True
                    )
                    sess.add(new_bom_item_old)
                    bom_item_id_old = sess.query(Bom_Item_Old).filter((Bom_Item_Old.id_bom_old == get_id_bom_old.id),(Bom_Item_Old.item_name == bom_item_value['item_name']),(Bom_Item_Old.inuse == True)).order_by((Bom_Item_Old.id).desc()).first()
                    bom_item_price_old = sess.query(Bom_Item_Price).filter(and_(Bom_Item_Price.id_bom_item == bom_item_value['id'], Bom_Item_Price.inuse == True)).first()
                    new_bom_item_price_old = Bom_Item_Price_Old(
                        id_bom_item_old = bom_item_id_old.id,
                        item_ratio_engcost = bom_item_price_old.item_ratio_engcost,
                        item_unit_amount = bom_item_price_old.item_unit_amount,
                        item_unit =  bom_item_price_old.item_unit,
                        item_unit_price = bom_item_price_old.item_unit_price,
                        item_amount_price = bom_item_price_old.item_amount_price,
                        item_actualcost = bom_item_price_old.item_actualcost,
                        item_ratio_actualcost = bom_item_price_old.item_ratio_actualcost,
                        item_engcost = bom_item_price_old.item_engcost,
                        item_engcost_month = bom_item_price_old.item_engcost_month,
                        onetime = bom_item_price_old.onetime,
                        inuse = True
                    )
                    sess.add(new_bom_item_price_old)
                delete_item = Bom_Item.query.filter_by(id_bom =data_edit["id"]).delete()
                for data_item in data_edit['item']:
                    new_bom_item = Bom_Item(
                        id_bom = data_edit["id"],
                        id_bd = data_item['id_bd'],
                        bd_name = data_item['bd_name'],
                        id_product = data_item['id_product'],
                        product_name = data_item['product_name'],
                        id_item = data_item['id_item'],
                        item_name = data_item['item_name'],
                        inuse = True
                    )
                    sess.add(new_bom_item)

                    bom_item_id = sess.query(Bom_Item).filter((Bom_Item.id_bom==data_edit["id"]) , (Bom_Item.item_name == data_item["item_name"]) , (Bom_Item.inuse == True)).order_by((Bom_Item.id).desc()).limit(1)
                    id_bom_item = []
                    for id in bom_item_id:
                        bom_item_dict = helper.serialize(id)
                        id_bom_item.append(bom_item_dict)

                    delete_item_price = Bom_Item_Price.query.filter_by(id_bom_item =id_bom_item[0]['id']).delete()
                    # update_item_price = Bom_Item_Price.query.filter_by(id_bom_item =id_bom_item[0]['id']).update(dict(inuse= False))# must delete this row item price
                    new_bom_item_price = Bom_Item_Price(
                        id_bom_item = id_bom_item[0]['id'],
                        item_ratio_engcost = data_item['ratio_engcost'],
                        item_unit_amount = data_item['unit_amount'],
                        item_unit =  data_item['unit'],
                        item_unit_price = data_item['unit_price'],
                        item_amount_price = data_item['amount_price'],
                        item_actualcost = data_item['actualcost'],
                        item_ratio_actualcost = data_item['ratio_actualcost'],
                        item_engcost = data_item['engcost'],
                        item_engcost_month = data_item['engcost_month'],
                        onetime = data_item['onetime'],
                        inuse = True
                    )
                    sess.add(new_bom_item_price)

                get_diagram = sess.query(Bom_Diagram).filter((Bom_Diagram.id_bom == data_edit["id"])).all()
                for diagram in get_diagram:
                    diagram_dict = helper.serialize(diagram)
                    new_bom_diagram_old = Bom_Diagram_Old(
                        id_bom_old = get_id_bom_old.id,
                        path = diagram_dict['path'],
                        img_name = diagram_dict['img_name'],
                        inuse = True
                    )
                    sess.add(new_bom_diagram_old)
                delete_diagram = Bom_Diagram.query.filter_by(id_bom = data_edit["id"]).delete()
                check_img,diagram = savediagram(data_edit['diagram'],data_edit['id'])
                if (check_img):
                    for i in diagram:
                        new_diagram = Bom_Diagram(
                            id_bom = data_edit['id'],
                            path = i['path'],
                            img_name = i['name'],
                            inuse = True
                        )
                        sess.add(new_diagram)
                else:
                    sess.rollback()
                    return json_response({"message": "can't save diagram"},400)

                get_vm_resource = sess.query(Bom_VM_Resource).filter((Bom_VM_Resource.id_bom == data_edit["id"])).all()
                for vm in get_vm_resource:
                    vm_dict = helper.serialize(vm)
                    new_bom_vm_resource_old = Bom_VM_Resource_Old(
                        id_bom_old = get_id_bom_old.id,
                        name_server = vm_dict['name_server'],
                        cpu = vm_dict['cpu'],
                        memory = vm_dict['memory'],
                        disk = vm_dict['disk'],
                        os = vm_dict['os'],
                        sql = vm_dict['sql'],
                        additional =vm_dict['additional'],
                        inuse = True
                    )
                    sess.add(new_bom_vm_resource_old)
                delete_vm_resource = Bom_VM_Resource.query.filter_by(id_bom = data_edit["id"]).delete()
                for vm in data_edit["vm_resource"]:
                    new_vm_resource = Bom_VM_Resource(
                        id_bom = data_edit["id"],
                        name_server = vm['name_server'],
                        cpu = vm['cpu'],
                        memory = vm['memory'],
                        disk = vm['disk'],
                        os = vm['os'],
                        sql = vm['sql'],
                        additional = vm['additional'],
                        inuse = True
                    )
                    sess.add(new_vm_resource)

                sess.commit()
                return json_response({"message": "Edit Complete", "status": 'success'},200)
            elif data['role_user'] == 'bd' or data['role_user'] == 'cost':
                version = float(data_edit['version']) + 0.01
                version = round(version, 2)
                get_old_bom_main = sess.query(Bom_Main).filter((Bom_Main.id == data_edit["id"])).first()
                old_bom = Bom_Main_Old(
                    id_bom_main = get_old_bom_main.id,
                    project_name = get_old_bom_main.project_name,
                    customer_name = get_old_bom_main.customer_name,
                    sale_id = get_old_bom_main.sale_id,
                    sale_name = get_old_bom_main.sale_name,
                    sale_tel = get_old_bom_main.sale_tel,
                    presale_id = get_old_bom_main.presale_id,
                    presale_name = get_old_bom_main.presale_name,
                    presale_tel =get_old_bom_main.presale_tel,
                    contract = get_old_bom_main.contract,
                    total_sale_price = get_old_bom_main.total_sale_price,
                    total_actualcost = get_old_bom_main.total_actualcost,
                    total_engcost = get_old_bom_main.total_engcost,
                    total_engcost_per_month = get_old_bom_main.total_engcost_per_month,
                    sale_factor = get_old_bom_main.sale_factor,
                    create_by = get_old_bom_main.create_by,
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    version = get_old_bom_main.version,
                    inuse = True
                )
                sess.add(old_bom)

                # update new version and create log
                update_main = Bom_Main.query.filter_by(id = data_edit["id"]).update(dict(contract = data_edit['contract'],total_sale_price = data_edit['total_sale_price'],total_actualcost = data_edit['total_actualcost'],total_engcost = data_edit['total_engcost'],total_engcost_per_month = data_edit['total_engcost_per_month'],sale_factor = data_edit['sale_factor'], version = version))
                new_bom_log = Bom_Log(
                    id_bom = data_edit["id"],
                    case_log = "EDIT",
                    version = data_edit['version'],
                    data_change = data['check_change'],
                    create_date = str(datetime.datetime.utcnow() + datetime.timedelta(hours=7)),
                    create_by = data["user_id"],
                    remark = data['remark']
                )
                sess.add(new_bom_log)
                # id old bom main
                get_id_bom_old = sess.query(Bom_Main_Old).order_by((Bom_Main_Old.id).desc()).first()

                # back up old version bd
                get_old_bom_bd = sess.query(Bom_BD).filter(and_(Bom_BD.id_bom == data_edit["id"],Bom_BD.inuse == True)).all()
                for bd_old in get_old_bom_bd:
                    bom_bd_value = helper.serialize(bd_old)
                    new_bom_bd_old = Bom_BD_Old(
                        id_bom_old = get_id_bom_old.id,
                        id_bd = bom_bd_value['id_bd'],
                        bd_name = bom_bd_value['bd_name'],
                        inuse = True
                    )
                    sess.add(new_bom_bd_old)
                delete_bd = Bom_BD.query.filter_by(id_bom = data_edit['id']).delete()
                # update_bd = Bom_BD.query.filter_by(id_bom = data_edit["id"]).update(dict(inuse= False))# must delete this row bd
                for data_item in data_edit["bd"]:
                    new_bom_bd = Bom_BD(
                        id_bom = data_edit["id"],
                        id_bd = data_item['bd_id'],
                        bd_name = data_item['bd_name'],
                        inuse = True
                    )
                    sess.add(new_bom_bd)

                # bacl up item
                get_old_bom_item = sess.query(Bom_Item).filter(and_(Bom_Item.id_bom == data_edit["id"],Bom_Item.inuse == True)).all()
                for item_old in get_old_bom_item:
                    bom_item_value = helper.serialize(item_old)
                    new_bom_item_old = Bom_Item_Old(
                        id_bom_old = get_id_bom_old.id,
                        id_bd = bom_item_value['id_bd'],
                        bd_name = bom_item_value['bd_name'],
                        id_product = bom_item_value['id_product'],
                        product_name = bom_item_value['product_name'],
                        id_item = bom_item_value['id_item'],
                        item_name = bom_item_value['item_name'],
                        inuse = True
                    )
                    sess.add(new_bom_item_old)
                    bom_item_id_old = sess.query(Bom_Item_Old).filter((Bom_Item_Old.id_bom_old == get_id_bom_old.id),(Bom_Item_Old.item_name == bom_item_value['item_name']),(Bom_Item_Old.inuse == True)).order_by((Bom_Item_Old.id).desc()).first()
                    bom_item_price_old = sess.query(Bom_Item_Price).filter(and_(Bom_Item_Price.id_bom_item == bom_item_value['id'], Bom_Item_Price.inuse == True)).first()
                    new_bom_item_price_old = Bom_Item_Price_Old(
                        id_bom_item_old = bom_item_id_old.id,
                        item_ratio_engcost = bom_item_price_old.item_ratio_engcost,
                        item_unit_amount = bom_item_price_old.item_unit_amount,
                        item_unit =  bom_item_price_old.item_unit,
                        item_unit_price = bom_item_price_old.item_unit_price,
                        item_amount_price = bom_item_price_old.item_amount_price,
                        item_actualcost = bom_item_price_old.item_actualcost,
                        item_ratio_actualcost = bom_item_price_old.item_ratio_actualcost,
                        item_engcost = bom_item_price_old.item_engcost,
                        item_engcost_month = bom_item_price_old.item_engcost_month,
                        onetime = bom_item_price_old.onetime,
                        inuse = True
                    )
                    sess.add(new_bom_item_price_old)

                delete_item = Bom_Item.query.filter_by(id_bom =data_edit["id"]).delete()
                # update_item = Bom_Item.query.filter_by(id_bom =data_edit["id"]).update(dict(inuse= False))# must delete this row item
                for data_item in data_edit['item']:
                    new_bom_item = Bom_Item(
                        id_bom = data_edit["id"],
                        id_bd = data_item['id_bd'],
                        bd_name = data_item['bd_name'],
                        id_product = data_item['id_product'],
                        product_name = data_item['product_name'],
                        id_item = data_item['id_item'],
                        item_name = data_item['item_name'],
                        inuse = True
                    )
                    sess.add(new_bom_item)

                    bom_item_id = sess.query(Bom_Item).filter((Bom_Item.id_bom==data_edit["id"]) , (Bom_Item.item_name == data_item["item_name"]) , (Bom_Item.inuse == True)).order_by((Bom_Item.id).desc()).limit(1)
                    id_bom_item = []
                    for id in bom_item_id:
                        bom_item_dict = helper.serialize(id)
                        id_bom_item.append(bom_item_dict)

                    delete_item_price = Bom_Item_Price.query.filter_by(id_bom_item =id_bom_item[0]['id']).delete()
                    # update_item_price = Bom_Item_Price.query.filter_by(id_bom_item =id_bom_item[0]['id']).update(dict(inuse= False))# must delete this row item price
                    new_bom_item_price = Bom_Item_Price(
                        id_bom_item = id_bom_item[0]['id'],
                        item_ratio_engcost = data_item['ratio_engcost'],
                        item_unit_amount = data_item['unit_amount'],
                        item_unit =  data_item['unit'],
                        item_unit_price = data_item['unit_price'],
                        item_amount_price = data_item['amount_price'],
                        item_actualcost = data_item['actualcost'],
                        item_ratio_actualcost = data_item['ratio_actualcost'],
                        item_engcost = data_item['engcost'],
                        item_engcost_month = data_item['engcost_month'],
                        onetime = data_item['onetime'],
                        inuse = True
                    )
                    sess.add(new_bom_item_price)

                sess.commit()
                return json_response({"message": "Edit Complete", "status": 'success'},200)
            else:
                return json_response({"message": "role user error"},400)
        else:
            return json_response({"message": "can't get bom id"},400)
    except IntegrityError as e:
        print 'error api edit bom: ',e
        sess.rollback()
        return json_response({"message": e.message},400)

@authener.check_token("user")
def getVersionBom(id_bom):
    global sess
    version = []
    bom_version = sess.query(Bom_Main.id,Bom_Main.version).filter(and_(Bom_Main.id == id_bom, Bom_Main.inuse == True)).first()
    version.append({'version': bom_version.version, 'new': True})
    bom_version_old = sess.query(Bom_Log).filter(and_(Bom_Log.case_log == 'EDIT', Bom_Log.id_bom == id_bom)).order_by((Bom_Log.id).desc()).all()
    for version_old in bom_version_old:
        log_dict = helper.serialize(version_old)
        version.append({'version': log_dict['version'], 'new': False})
    return json_response({"version": version},200)


@authener.check_token("user")
def downloadExcel(id_bom,version):
    global sess
    try:
        bom_sale_log = sess.query(Bom_Sale_Log).filter((Bom_Sale_Log.id_bom == id_bom)).order_by((Bom_Sale_Log.id).desc()).limit(1)
        check_approve = {}
        for log in bom_sale_log:
            check_approve = helper.serialize(log)
        if check_approve['case_log'] == 'APPROVE':
            check_new_bom = sess.query(Bom_Main).filter(and_(Bom_Main.id == id_bom, Bom_Main.version == version ,Bom_Main.inuse == True)).all()
            if len(check_new_bom) > 0:
                get_bom_main = sess.query(Bom_Main).filter(and_(Bom_Main.id==id_bom, Bom_Main.inuse == True)).first()
                bom_document = helper.serialize(get_bom_main)

        #-----------------------------------------------------------------onetime
                get_product_onetime = sess.query(Bom_Item.product_name).outerjoin(Bom_Item_Price, Bom_Item.id == Bom_Item_Price.id_bom_item).filter(and_(Bom_Item.id_bom==id_bom, Bom_Item.inuse == True, Bom_Item_Price.inuse == True,Bom_Item_Price.onetime == True)).distinct(Bom_Item.product_name).all()
                bom_document["product_onetime"] = []
                for product_onetime in get_product_onetime:
                    bom_item = {}
                    bom_item['product_name'] = product_onetime[0]
                    bom_item['item'] = []
                    get_item_onetime = sess.query(Bom_Item, Bom_Item_Price).outerjoin(Bom_Item_Price, Bom_Item.id == Bom_Item_Price.id_bom_item).filter(and_(Bom_Item.product_name == bom_item['product_name'],Bom_Item.id_bom==id_bom, Bom_Item.inuse == True, Bom_Item_Price.inuse == True,Bom_Item_Price.onetime == True)).all()
                    for item_onetime in get_item_onetime:
                        item = {}
                        bom_item_dict = helper.serialize(item_onetime.Bom_Item)
                        bom_item_price_dict = helper.serialize(item_onetime.Bom_Item_Price)
                        item.update(bom_item_dict)
                        item.update(bom_item_price_dict)

                        bom_item['item'].append(item)
                    bom_document["product_onetime"].append(bom_item)

        # -----------------------------------------------------------------recurring
                get_product_recurring = sess.query(Bom_Item.product_name).outerjoin(Bom_Item_Price, Bom_Item.id == Bom_Item_Price.id_bom_item).filter(and_(Bom_Item.id_bom==id_bom, Bom_Item.inuse == True, Bom_Item_Price.inuse == True,Bom_Item_Price.onetime == False)).distinct(Bom_Item.product_name).all()
                bom_document["product_recurring"] = []
                for product_recurring in get_product_recurring:
                    bom_item = {}
                    bom_item['product_name'] = product_recurring[0]
                    bom_item['item'] = []
                    get_item_recurring = sess.query(Bom_Item, Bom_Item_Price).outerjoin(Bom_Item_Price, Bom_Item.id == Bom_Item_Price.id_bom_item).filter(and_(Bom_Item.product_name == bom_item['product_name'],Bom_Item.id_bom==id_bom, Bom_Item.inuse == True, Bom_Item_Price.inuse == True,Bom_Item_Price.onetime == False)).all()
                    for item_recurring in get_item_recurring:
                        item = {}
                        bom_item_dict = helper.serialize(item_recurring.Bom_Item)
                        bom_item_price_dict = helper.serialize(item_recurring.Bom_Item_Price)
                        item.update(bom_item_dict)
                        item.update(bom_item_price_dict)
                        bom_item['item'].append(item)

                    bom_document["product_recurring"].append(bom_item)

                check_excel = createXlsx(bom_document)
                if check_excel:
                    return send_file(os.getcwd() + "/apps/boms/export_file/bom_report-" + str(bom_document['id']) + ".xlsx", attachment_filename="bom_report-" + str(bom_document['id']) + ".xlsx", as_attachment=True, cache_timeout=0)
                else:
                    return json_response({"message": 'gen excel error'}, 400)
            else:
                get_bom_main = sess.query(Bom_Main_Old).filter(and_(Bom_Main_Old.id_bom_main==id_bom, Bom_Main_Old.version == version, Bom_Main_Old.inuse == True)).first()
                bom_document = helper.serialize(get_bom_main)

        #-----------------------------------------------------------------onetime
                get_product_onetime = sess.query(Bom_Item_Old.product_name).outerjoin(Bom_Item_Price_Old, Bom_Item_Old.id == Bom_Item_Price_Old.id_bom_item_old).filter(and_(Bom_Item_Old.id_bom_old==bom_document['id'], Bom_Item_Old.inuse == True, Bom_Item_Price_Old.inuse == True,Bom_Item_Price_Old.onetime == True)).distinct(Bom_Item_Old.product_name).all()
                bom_document["product_onetime"] = []
                for product_onetime in get_product_onetime:
                    bom_item = {}
                    bom_item['product_name'] = product_onetime[0]
                    bom_item['item'] = []
                    get_item_onetime = sess.query(Bom_Item_Old, Bom_Item_Price_Old).outerjoin(Bom_Item_Price_Old, Bom_Item_Old.id == Bom_Item_Price_Old.id_bom_item_old).filter(and_(Bom_Item_Old.product_name == bom_item['product_name'],Bom_Item_Old.id_bom_old==bom_document['id'], Bom_Item_Old.inuse == True, Bom_Item_Price_Old.inuse == True,Bom_Item_Price_Old.onetime == True)).all()
                    for item_onetime in get_item_onetime:
                        item = {}
                        bom_item_dict = helper.serialize(item_onetime.Bom_Item_Old)
                        bom_item_price_dict = helper.serialize(item_onetime.Bom_Item_Price_Old)
                        item.update(bom_item_dict)
                        item.update(bom_item_price_dict)

                        bom_item['item'].append(item)
                    bom_document["product_onetime"].append(bom_item)

        # -----------------------------------------------------------------recurring
                get_product_recurring = sess.query(Bom_Item_Old.product_name).outerjoin(Bom_Item_Price_Old, Bom_Item_Old.id == Bom_Item_Price_Old.id_bom_item_old).filter(and_(Bom_Item_Old.id_bom_old==bom_document['id'], Bom_Item_Old.inuse == True, Bom_Item_Price_Old.inuse == True,Bom_Item_Price_Old.onetime == False)).distinct(Bom_Item_Old.product_name).all()
                bom_document["product_recurring"] = []
                for product_recurring in get_product_recurring:
                    bom_item = {}
                    bom_item['product_name'] = product_recurring[0]
                    bom_item['item'] = []
                    get_item_recurring = sess.query(Bom_Item_Old, Bom_Item_Price_Old).outerjoin(Bom_Item_Price_Old, Bom_Item_Old.id == Bom_Item_Price_Old.id_bom_item_old).filter(and_(Bom_Item_Old.product_name == bom_item['product_name'],Bom_Item_Old.id_bom_old==bom_document['id'], Bom_Item_Old.inuse == True, Bom_Item_Price_Old.inuse == True,Bom_Item_Price_Old.onetime == False)).all()
                    for item_recurring in get_item_recurring:
                        item = {}
                        bom_item_dict = helper.serialize(item_recurring.Bom_Item_Old)
                        bom_item_price_dict = helper.serialize(item_recurring.Bom_Item_Price_Old)
                        item.update(bom_item_dict)
                        item.update(bom_item_price_dict)
                        bom_item['item'].append(item)

                    bom_document["product_recurring"].append(bom_item)

                check_excel = createXlsx(bom_document)
                if check_excel:
                    return send_file(os.getcwd() + "/apps/boms/export_file/bom_report-" + str(bom_document['id']) + ".xlsx", attachment_filename="bom_report-" + str(bom_document['id']) + ".xlsx", as_attachment=True, cache_timeout=0)
                else:
                    return json_response({"message": 'gen excel error'}, 400)
        else:
            return json_response({"message": 'process approve not be agree'}, 400)
    except Exception as e:
        print 'error export excel: ', e
        return json_response({"message": e.message}, 400)
