# -*- coding: utf-8 -*
import controller
from flask import Blueprint


# ============== Flask router register ==============

routes = Blueprint('requests', __name__)

routes.add_url_rule(
    '',
    'getAllRequest',
    controller.getAllRequest,
    methods=['GET'],
)

routes.add_url_rule(
    '/<string:id_user>',
    'getUserRequest',
    controller.getRequest,
    methods=['GET'],
)

routes.add_url_rule(
    '',
    'createRequest',
    controller.createRequest,
    methods=['POST'],
)

routes.add_url_rule(
    '',
    'editRequest',
    controller.editRequest,
    methods=['PUT'],
)

routes.add_url_rule(
    '/approve/<string:id_request>',
    'approveRequest',
    controller.approveRequest,
    methods=['PUT'],
)

routes.add_url_rule(
    '/<string:id_request>/<string:id_user>/<string:block>',
    'blockRequest',
    controller.blockRequest,
    methods=['DELETE'],
)