from typing import Counter
import pymysql
from flask import Flask,request,render_template,g,jsonify
from flask_httpauth import HTTPBasicAuth
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import BadSignature,SignatureExpired
import re
import time
from pymysql import cursors
from datetime import date

from pymysql.cursors import Cursor

auth = HTTPBasicAuth()
SECCRET_KEY = 'FCYXAAAA'


def db_connect():
    db = pymysql.connect(
            host = "47.96.148.218",
            port = 3306,
            user = 'zhp',
            passwd='521224',
            db='teambase',
            charset='utf8'
            )
    return db



def queryByKey(tablename,key,value):
    db = db_connect()
    Cursor = db.cursor()
    sql = "SELECT * FROM {tablename} WHERE {key}={value}".format(tablename=tablename,key=key,value=value)
    Cursor.execute(sql)
    rows = Cursor.fetchone()
    Cursor.close()
    return rows

def queryBy2Key(tablename,key1,value1,key2,value2):
    db = db_connect()
    cursor = db.cursor()
    sql = "SELECT * FROM {tablename} WHERE {key1}={value1} and {key2}={value2}".format(tablename=tablename,key1=key1,value1=value1,key2=key2,value2=value2)
    cursor.execute(sql)
    rows = cursor.fetchone()
    cursor.close()
    return rows

def Update(tablename,key,keyvalue,field,fieldvalue):
    db = db_connect()
    cursor = db.cursor()
    sql = "UPDATE {TABLENAME} SET {FIELD}={FIELDVALUE} WHERE {KEY}={KEYVALUE}".format(TABLENAME=tablename,KEY=key,KEYVALUE=keyvalue,FIELD=field,FIELDVALUE=fieldvalue)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    cursor.close()

def Update2Key(tablename,key1,key1value,key2,key2value,field,fieldvalue):
    db = db_connect()
    cursor = db.cursor()
    sql = "UPDATE {TABLENAME} SET {FIELD}={FIELDVALUE} WHERE {KEY1}={KEY1VALUE} AND {KEY2}={KEY2VALUE}".format(TABLENAME=tablename,KEY1=key1,KEY1VALUE=key1value,KEY2=key2,KEY2VALUE=key2value,FIELD=field,FIELDVALUE=fieldvalue)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    cursor.close()

def InsertAdministrator(userID,userPassword,registerTime,userType):
    db = db_connect()
    Cursor = db.cursor()
    sql = "INSERT INTO Administrators(userID,userPassword,registerTime,userType) VALUES({userID},'{userPassword}','{registerTime}',{userType})".format(userID=userID,userPassword=userPassword,registerTime=registerTime,userType=userType)
    try:
        Cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    Cursor.close()

def InsertOrdinaryUser(userID,userPassword,registerTime,userType,userName,School):
    db = db_connect()
    cursor = db.cursor()
    sql = "INSERT INTO OrdinaryUsers(userID,userPassword,registerTime,userType,userName,School) VALUES({userID},'{userPassword}','{registerTime}',{userType},'{userName}','{School}')".format(userID=userID,userPassword=userPassword,registerTime=registerTime,userType=userType,userName=userName,School=School)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    cursor.close()

def InsertActivity(activityID,activityName,position,deadline,activityTime,userID,content,stateType,userName):
    db = db_connect()
    cursor = db.cursor()
    sql = "INSERT INTO Activitys(activityID,activityName,position,deadline,userID,content,stateType,userName) VALUES({activityID},'{activityName}','{position}','{deadline}','{activityTime}',{userID},'{content}',{stateType},'{userName}')".format(activityID=activityID,activityName=activityName,position=position,deadline=deadline,activityTime=activityTime,userID=userID,content=content,stateType=stateType,userName=userName)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    cursor.close()

def InsertComment(commentID,userID,activityID,publichTime,content,stateType):
    db = db_connect()
    cursor = db.cursor()
    sql = "INSERT INTO Comments(commentID,userID,activityID,publishTime,content,stateType) VALUES({commentID},{userID},{activityID},'{publishTime}','{content}',{stateType})".format(commentID=commentID,userID=userID,activityID=activityID,publichTime=publichTime,content=content,stateType=stateType)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    cursor.close()

def InsertTag(tagID,tagName,activityID):
    db = db_connect()
    cursor = db.cursor()
    sql = "INSERT INTO Tags(tagID,tagName,activityID) VALUES({tagID},'{tagName}',{activityID})".format(tagID=tagID,tagName=tagName,activityID=activityID)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    cursor.close()

def InsertAttend(userID,activityID,attendTime,attendReason,stateType):
    db = db_connect()
    cursor = db.cursor()
    sql = "INSERT INTO Attends(userID,activityID,attendTime,attendReason,stateType) VALUES({userID},{activityID},'{attendTime}','{attendReason}',{stateType})".format(userID=userID,activityID=activityID,attendTime=attendTime,attendReason=attendReason,stateType=stateType)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    cursor.close()

def InsertLike(activityID,userID,likeTime):
    db = db_connect()
    cursor = db.cursor()
    sql = "INSERT INTO Likes(activityID,userID,likeTime) VALUES({activityID},{userID},'{likeTime}')".format(activityID=activityID,userID=userID,likeTime=likeTime)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    cursor.close()

def Delete(tablename,key,value):
    db = db_connect()
    cursor = db.cursor()
    sql = "DELETE FROM {TABLENAME} WHERE {KEY}={VALUE}".format(TABLENAME=tablename,KEY=key,VALUE=value)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    cursor.close()

def Delete2Key(tablename,key1,value1,key2,value2):
    db = db_connect()
    cursor = db.cursor()
    sql = "DELETE FROM {TABLENAME} WHERE {KEY1}={VALUE1} AND {KEY2}={VALUE2}".format(TABLENAME=tablename,KEY1=key1,VALUE1=value1,KEY2=key2,VALUE2=value2)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    cursor.close()