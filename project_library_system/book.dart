class Book{
  int id;
  String title;
  bool isBorrowed;  

  Book(this.id, this.title, this.isBorrowed);

  void displayInfo(){
    print("Book ID: ${this.id}, Title: ${this.title}, Borrowed: ${this.isBorrowed}");
   
  }


}