from flask import Blueprint, render_template, request
from books import load_books

search_bp = Blueprint('home_bp', __name__,
    template_folder='templates',

    )


# Page de bienvenue
@search_bp.route('/', methods=['GET'])
def home():
    return render_template('search/search_book.html', results=[])


@search_bp.route('/search', methods=['POST'])
def search():
    book_name = request.form.get('bookName')
    book_id = request.form.get('bookId')

    books = load_books()
    filtered_results = []
    if book_name:
        filtered_results = [book for book in books if book_name.lower() in book['title'].lower()]
    elif book_id:
        filtered_results = [book for book in books if str(book['id']) == book_id]

    return render_template('search/search_book.html', results=filtered_results)


