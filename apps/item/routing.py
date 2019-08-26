# -*- coding: utf-8 -*
# print '...start routing item'
from flask import Blueprint
import controller


# ============== Flask router register ==============

routes = Blueprint('items',__name__)
routes.add_url_rule(
    '',
    'getItem',
    controller.get_all_item,
    methods=['GET'],
)

routes.add_url_rule(
    '/<string:role_user>/<string:team_user>',
    'getitem',
    controller.getItem,
    methods=['GET'],
)

routes.add_url_rule(
    '/<string:id_item>/<string:user_id>/<string:block>',
    'blockItem',
    controller.blockItem,
    methods=['DELETE'],
)

routes.add_url_rule(
    '',
    'createItem',
    controller.createItem,
    methods=['POST'],
)

routes.add_url_rule(
    '',
    'editItem',
    controller.editItem,
    methods=['PUT'],
)
