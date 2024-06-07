import json

def load_books():
    with open('books.json', 'r') as file:
        return json.load(file)

def save_books(books):
    with open('books.json', 'w') as file:
        json.dump(books, file, indent=4)

books = load_books()
