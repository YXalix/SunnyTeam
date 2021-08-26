from flask import Flask,request,render_template,g,jsonify,flash,session,redirect,url_for
from markupsafe import escape
from flask_httpauth import HTTPBasicAuth
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import BadSignature,SignatureExpired
import json
import psycopg2

app = Flask(__name__)
auth = HTTPBasicAuth()
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

@app.route('/login')
def login():
    return "hello world"


