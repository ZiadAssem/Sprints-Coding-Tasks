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