import os
import tracemalloc
from flask import Flask, jsonify, request, render_template, send_from_directory
import requests
import json
import string
import random
tracemalloc.start()


# FLASK

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")
    

@app.errorhandler(404)
def pagenotfound(error):
    return "<h1>I didn't create this page :/, skill issue lmfao<h1>", 404

@app.route("/webhook", methods=["GET"])
def webhak():
    id = request.args.get("id")
    token = request.args.get("token")
    content = request.args.get("content")
    username = request.args.get("username")
    if not username:
        username = None
    data = {
        'content' : content,
        'username' : username
    }
    
    requestd = requests.post(f"https://discord.com/api/webhooks/{id}/{token}", json=data, headers={"Content-Type": "application/json"})
    data1 = {
        'status' : requestd.status_code
    }
    return jsonify(data1)

@app.route("/codes/<name>")
def showcode(name):
    return name

def runflask():
    app.run(host="0.0.0.0", port=21316)

if __name__ == "__main__":
    runflask()
