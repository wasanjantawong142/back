import os
_basedir = os.path.abspath(os.path.dirname(__file__))

SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:toor@db:3306/bom_demo_test"
# cockroachdb://root@localhost:26257/let_do_it?sslmode=disable
