# -*- coding: utf-8 -*
# print '...start routing boms----------------------------'
from flask import Blueprint
import controller


# ============== Flask router register ==============

routes = Blueprint('reports',__name__)

routes.add_url_rule(
    '/<string:user_id>/<string:position>/<string:type_report>',
    'getReportBom',
    controller.getReport,
    methods=['GET'],
)

routes.add_url_rule(
    '/history',
    'getHistory',
    controller.getHistory,
    methods=['GET'],
)
