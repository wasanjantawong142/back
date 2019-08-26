# -*- coding: utf-8 -*
import controller
from flask import Blueprint


# ============== Flask router register ==============

routes = Blueprint('groups', __name__)

routes.add_url_rule(
    '',
    'getAllGroup',
    controller.getAllGroup,
    methods=['GET'],
)

routes.add_url_rule(
    '/position',
    'getAllGroupPosition',
    controller.getAllGroupPosition,
    methods=['GET'],
)

routes.add_url_rule(
    '',
    'creategroup',
    controller.createGroup,
    methods=['POST'],
)

routes.add_url_rule(
    '',
    'editgroup',
    controller.editGroup,
    methods=['PUT'],
)

routes.add_url_rule(
    '/<string:group_id>',
    'getGroup',
    controller.getGroup,
    methods=['GET'],
)

routes.add_url_rule(
    '/<int:group_id>/<string:block>/',
    'delGroup',
    controller.delGroup,
    methods=['DELETE'],
)

# routes.add_url_rule(
#     '',
#     'getUserData',
#     controller.getUserData,
#     methods=['GET'],
# )
#
# routes.add_url_rule(
#     '',
#     'createUser',
#     controller.apiCreateUser,
#     methods=['POST'],
# )
