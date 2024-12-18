class User{
  int id;
  String name;

  User(this.id, this.name);

  void displayInfo(){
    print("User ID: ${this.id}, Name: ${this.name}");
  }
}