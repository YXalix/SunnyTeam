from flask import Flask,request,render_template,g,jsonify,flash,session,redirect,url_for
from markupsafe import escape
from flask_httpauth import HTTPBasicAuth
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import BadSignature,SignatureExpired
import json
import psycopg2

import Models.dao as dao
from Models.OrdinaryUser import OrdinaryUser


from datetime import date, datetime

class ComplexEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')
        elif isinstance(obj, date):
            return obj.strftime('%Y-%m-%d')
        else:
            return json.JSONEncoder.default(self, obj)


app = Flask(__name__)
auth = HTTPBasicAuth()
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

@app.route('/login')
def login():
    user = OrdinaryUser()
    user.OrdinaryInitByID(516875454)
    jsonuser = json.dumps(user.__dict__, cls=ComplexEncoder)
    
    return jsonuser


