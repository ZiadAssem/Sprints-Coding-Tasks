# Library Management System

This Dart project demonstrates a simple library management system using four classes: `Library`, `Book`, `User`, and the `main` function. The system allows adding books, adding users, borrowing books, returning books, and displaying the library's information.

## File Structure

- **`main.dart`**: The entry point of the application, responsible for interacting with the `Library` class.
- **`library.dart`**: Contains the `Library` class, which manages books and users.
- **`book.dart`**: Contains the `Book` class, representing individual books in the library.
- **`user.dart`**: Contains the `User` class, representing library users.

---

## `main.dart`

This file serves as the entry point for the application.

### Code Overview

```dart
import 'book.dart';
import 'library.dart';
import 'user.dart';

void main(){
  Library library = Library([], []);

  library.addBook(Book(1, "The Great Gatsby", false));
  library.addBook(Book(2, "To Kill a Mockingbird", false));
  library.addBook(Book(3, "1984", false));

  library.addUser(User(1, "Ziad"));
  library.addUser(User(2, "Ahmed"));
  library.addUser(User(3, "Ali"));

  library.displayInfo();

  library.borrowBook(1);
  library.borrowBook(2);

  library.displayInfo();
}
```

### Functionality

1. **Initialize Library**: An empty library is created with no books or users.
2. **Add Books**: Adds three books to the library.
3. **Add Users**: Adds three users to the library.
4. **Display Library Info**: Displays all books and users.
5. **Borrow Books**: Borrows books with IDs `1` and `2`.
6. **Display Updated Info**: Displays updated library information after borrowing books.

---

## `library.dart`

### Code Overview

```dart
import 'book.dart';
import 'user.dart';

class Library {
  List<Book> books;
  List<User> users;

  Library(this.books, this.users);

  void addBook(Book book) {
    books.add(book);
  }

  void returnBook(int bookId) {
    print('Returning book with ID: \$bookId');
    books.firstWhere((book) => book.id == bookId).isBorrowed = false;
  }

  void borrowBook(int bookId) {
    print('Borrowing book with ID: \$bookId');
    books.firstWhere((book) => book.id == bookId).isBorrowed = true;
  }

  void addUser(User user) {
    users.add(user);
  }

  void displayInfo() {
    print('---------------------------------------------');
    print("Library Information:");
    print("Books:");
    books.forEach((book) => book.displayInfo());
    print("Users:");
    users.forEach((user) => user.displayInfo());
    print('---------------------------------------------');
  }
}
```

### Key Methods

- **`addBook(Book book)`**: Adds a book to the library.
- **`returnBook(int bookId)`**: Marks a book as returned.
- **`borrowBook(int bookId)`**: Marks a book as borrowed.
- **`addUser(User user)`**: Adds a user to the library.
- **`displayInfo()`**: Displays the list of books and users.

---

## `book.dart`

### Code Overview

```dart
class Book{
  int id;
  String title;
  bool isBorrowed;  

  Book(this.id, this.title, this.isBorrowed);

  void displayInfo(){
    print("Book ID: \${this.id}, Title: \${this.title}, Borrowed: \${this.isBorrowed}");
  }
}
```

### Attributes

- **`id`**: The unique identifier for the book.
- **`title`**: The title of the book.
- **`isBorrowed`**: A boolean indicating if the book is borrowed.

### Method

- **`displayInfo()`**: Prints the book's information.

---

## `user.dart`

### Code Overview

```dart
class User{
  int id;
  String name;

  User(this.id, this.name);

  void displayInfo(){
    print("User ID: \${this.id}, Name: \${this.name}");
  }
}
```

### Attributes

- **`id`**: The unique identifier for the user.
- **`name`**: The name of the user.

### Method

- **`displayInfo()`**: Prints the user's information.

---


## Sample Output

```
---------------------------------------------
Library Information:
Books:
Book ID: 1, Title: The Great Gatsby, Borrowed: false
Book ID: 2, Title: To Kill a Mockingbird, Borrowed: false
Book ID: 3, Title: 1984, Borrowed: false
Users:
User ID: 1, Name: Ziad
User ID: 2, Name: Ahmed
User ID: 3, Name: Ali
---------------------------------------------
Borrowing book with ID: 1
Borrowing book with ID: 2
---------------------------------------------
Library Information:
Books:
Book ID: 1, Title: The Great Gatsby, Borrowed: true
Book ID: 2, Title: To Kill a Mockingbird, Borrowed: true
Book ID: 3, Title: 1984, Borrowed: false
Users:
User ID: 1, Name: Ziad
User ID: 2, Name: Ahmed
User ID: 3, Name: Ali
---------------------------------------------
```

---