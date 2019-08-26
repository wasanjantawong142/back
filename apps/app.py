# print "..init apps"
from flask import Flask, render_template


app = Flask(__name__)
app.config.from_object('config')

@app.after_request
def after_request(response):
    response.headers.add(
        'Access-Control-Allow-Origin',
        '*'
    )
    response.headers.add(
        'Access-Control-Allow-Headers',
        'Content-Type,Authorization'
    )
    response.headers.add(
        'Access-Control-Allow-Methods',
        'GET,PUT,POST,DELETE,OPTIONS'
    )
    response.headers['Cache-Control']='public, max-age=0'
    return response
# print '..finish init apps'
