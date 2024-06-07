from flask import Blueprint, render_template, request, redirect, url_for
from books import load_books, save_books


add_book_bp = Blueprint('add_book_bp', __name__, template_folder='templates')

books = [
    {
        'id': 1,
        'title': '1984',
        'author': 'George Orwell',
        'published': 1949
    },
    {
        'id': 2,
        'title': 'To Kill a Mockingbird',
        'author': 'Harper Lee',
        'published': 1960
    }
]

@add_book_bp.route('/', methods=['GET'])
def home():
    return render_template('add/add_book.html')

@add_book_bp.route('/add', methods=['POST'])
def add_book():
    book_name = request.form.get('bookName')
    book_id = request.form.get('bookId')
    books = load_books()

    for book in books:
        if str(book['id']) == book_id:
            message = f"{book_id} existe déjà - veuillez entrer un autre Id"
            return render_template('add/add_book.html', messages= message)
        elif book['title'].lower() == book_name.lower():
            message = f"{book_name} existe déjà - veuillez entrer un autre nom de livre"
            return render_template('add/add_book.html', messages= message)
            
    new_book = {
        'id': int(book_id),
        'title': book_name,
        'author': 'Unknown',  
        'published': 2024
    }
    books.append(new_book)
    save_books(books)

    return redirect(url_for('add_book_bp.home'))
