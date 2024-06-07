from flask import Flask
from search.search import search_bp
from add.add_book import add_book_bp

app = Flask(__name__)



app.register_blueprint(search_bp, url_prefix='/home')
app.register_blueprint(add_book_bp, url_prefix='/addbook')

@app.route('/', methods=['GET', 'POST'])
def welcome():
    return "Welcome !!"

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)
