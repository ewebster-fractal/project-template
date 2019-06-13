import flask
from flask import request, jsonify

# Import your code below
# Example:
# from source.my_module import SomeClass

# Initialize the Flask Application
app = flask.Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    return 'Web service designed for pipeline orchestration'

# example route within API
@app.route('/hello', methods=['GET'])
def hello():
    return 'Hello world'

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)