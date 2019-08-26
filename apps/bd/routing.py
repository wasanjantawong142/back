# -*- coding: utf-8 -*
# print '...start routing item'
from flask import Blueprint
import controller


# ============== Flask router register ==============

routes = Blueprint('bds',__name__)

routes.add_url_rule(
    '',
    'getBD',
    controller.getBD,
    methods=['GET'],
)

routes.add_url_rule(
    '/<int:id>/<string:block>/<string:user_id>',
    'blockBD',
    controller.blockBD,
    methods=['DELETE'],
)

routes.add_url_rule(
    '',
    'createBD',
    controller.createBD,
    methods=['POST'],
)

routes.add_url_rule(
    '',
    'editBD',
    controller.editBD,
    methods=['PUT'],
)

# print '...finish routing item'
