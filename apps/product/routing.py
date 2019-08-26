# -*- coding: utf-8 -*
# print '...start routing item'
from flask import Blueprint
import controller


# ============== Flask router register ==============

routes = Blueprint('products',__name__)

routes.add_url_rule(
    '/<string:role_user>/<string:team_user>',
    'getproduct',
    controller.getProduct,
    methods=['GET'],
)

routes.add_url_rule(
    '/<string:id_product>/<string:user_id>/<string:block>',
    'blockProduct',
    controller.blockProduct,
    methods=['DELETE'],
)

routes.add_url_rule(
    '',
    'createProduct',
    controller.createProduct,
    methods=['POST'],
)

routes.add_url_rule(
    '',
    'editProduct',
    controller.editProduct,
    methods=['PUT'],
)
