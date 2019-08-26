# -*- coding: utf-8 -*
# print '...start routing boms----------------------------'
from flask import Blueprint
import controller


# ============== Flask router register ==============

routes = Blueprint('boms',__name__)

routes.add_url_rule(
    '/<string:role_user>/<string:user_id>/<string:user_level>',
    'getReportBom',
    controller.getReportBoms,
    methods=['GET'],
)

routes.add_url_rule(
    '/<string:id_bom>/<string:version>',
    'getDocumentBom',
    controller.getDocumentBom,
    methods=['GET'],
)

routes.add_url_rule(
    '/approve',
    'approvebom',
    controller.approveBom,
    methods=['PUT'],
)

routes.add_url_rule(
    '/reject',
    'rejectbom',
    controller.rejectBom,
    methods=['PUT'],
)

routes.add_url_rule(
    '',
    'createbom',
    controller.createBom,
    methods=['POST'],
)

routes.add_url_rule(
    '',
    'editbom',
    controller.editBom,
    methods=['PUT'],
)

routes.add_url_rule(
    '/report/<string:id_bom>/<string:version>',
    'downloadExcel',
    controller.downloadExcel,
    methods=['GET'],
)

routes.add_url_rule(
    '/version/<string:id_bom>',
    'getversionbom',
    controller.getVersionBom,
    methods=['GET'],
)
