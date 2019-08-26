# -*- coding: utf-8 -*
import controller
from flask import Blueprint


# ============== Flask router register ==============

routes = Blueprint('users', __name__)

routes.add_url_rule(
    '',
    'getAllUser',
    controller.getAllUser,
    methods=['GET'],
)

routes.add_url_rule(
    '',
    'createUser',
    controller.createUser,
    methods=['POST'],
)

routes.add_url_rule(
    '',
    'editUser',
    controller.editUser,
    methods=['PUT'],
)

routes.add_url_rule(
    '/<string:staff_id>',
    'getStaff',
    controller.getStaff,
    methods=['GET'],
)
