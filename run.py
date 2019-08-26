from apps.app import app
from apps.database import init_db
from apps.routes import init_routes


init_db()
init_routes()
app.run(host="0.0.0.0", port=9000, threaded=True)
