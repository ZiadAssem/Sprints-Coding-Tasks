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
    print('Returning book with ID: $bookId');
    books.firstWhere((book) => book.id == bookId).isBorrowed = false;
  }

  void borrowBook(int bookId) {
    print('Borrowing book with ID: $bookId');
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
