# -*- coding: utf-8 -*
from flask import Blueprint
import controller


# ============== Flask router register ==============

routes = Blueprint('authener',__name__)
routes.add_url_rule(
    '/login',
    'login',
    controller.apiLogin,
    methods=['POST']
)

routes.add_url_rule(
    '/loginadmin',
    'loginadmin',
    controller.apiLoginAdmin,
    methods=['POST']
)

routes.add_url_rule(
    '/state/<string:username>',
    'get_state',
    controller.apiGenerateState,
    methods=['GET']
)
#
routes.add_url_rule(
    '/logout',
    'logout',
    controller.apiLogout,
    methods = ['GET']
)
routes.add_url_rule(
    '/refresh',
    'refresh',
    controller.apiRefreshToken,
    methods = ['POST']
)
