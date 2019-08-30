# -*- coding: utf-8 -*
# print 'start init routing'
from .boms.routing import routes as bom_route
from .item.routing import routes as item_route
from .product.routing import routes as product_route
from .authener.routing import routes as authener_route
from .user.routing import routes as user_route
from .group.routing import routes as group_route
from .bd.routing import routes as bd_route
from .report.routing import routes as report_route
from .openapi.routing import routes as open_api
<<<<<<< HEAD
from .userone.routing import routes as userone_route
=======
from .request.routing import routes as request_route
>>>>>>> 907953f2f01a802f17d1bb14a82cada125a546a1
from .app import app


def root_endpoint():
    return 'Hello World.'


def init_routes():
    app.add_url_rule( '/','root_endpoint',root_endpoint,methods=['GET'])
    app.register_blueprint(authener_route, url_prefix="/api/v1")
    app.register_blueprint(bom_route, url_prefix="/api/v1/boms")
    app.register_blueprint(item_route, url_prefix="/api/v1/items")
    app.register_blueprint(product_route, url_prefix="/api/v1/products")
    app.register_blueprint(user_route,url_prefix="/api/v1/users")
    app.register_blueprint(group_route,url_prefix="/api/v1/groups")
    app.register_blueprint(bd_route,url_prefix="/api/v1/bds")
    app.register_blueprint(report_route,url_prefix="/api/v1/reports")
    app.register_blueprint(open_api,url_prefix="/api/v1/open_api")
<<<<<<< HEAD
    app.register_blueprint(userone_route,url_prefix="/api/v1/userone")
=======
    app.register_blueprint(request_route,url_prefix="/api/v1/requests")
>>>>>>> 907953f2f01a802f17d1bb14a82cada125a546a1


# print 'finish init routing'
