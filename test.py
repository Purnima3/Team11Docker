from flask import Flask, render_template, jsonify
import json
import requests

app = Flask(__name__)

@app.route("/")
def hello_world():
    return render_template("index.html")

@app.route("/posts")
def posts():
    response = requests.get("https://jsonplaceholder.typicode.com/posts")
    json_output = json.loads(response.text)
    print(type(json_output))
    return json_output