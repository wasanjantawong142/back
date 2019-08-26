# -*- coding: utf-8 -*
# print '...start routing boms----------------------------'
from flask import Blueprint
import controller


# ============== Flask router register ==============

routes = Blueprint('open_api',__name__)

routes.add_url_rule(
    '',
    'createbom',
    controller.createBom,
    methods=['POST'],
)

routes.add_url_rule(
    '',
    'statusBom',
    controller.statusBom,
    methods=['PUT'],
)

routes.add_url_rule(
    '/presale/all',
    'getPresale',
    controller.getPresale,
    methods=['GET'],
)
