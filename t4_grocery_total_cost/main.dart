
void main() {
  const double taxRate = 0.10;

  List<Map<String, dynamic>> groceryItems = [
    {'name': 'Milk', 'price': 3.5},
    {'name': 'Bread', 'price': 2.0},
    {'name': 'Eggs', 'price': 2.5},
    {'name': 'Cheese', 'price': 4.0},
  ];

  double totalPrice = 0.0;

  // loops on all maps in the list, and adds price to total price
  for (var item in groceryItems) {
    totalPrice += item['price'];
  }

  // adds the tax constant
  double totalWithTax = totalPrice + (totalPrice * taxRate);

  // prints price with and without tax
  print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
  print('Total Price with Tax: \$${totalWithTax.toStringAsFixed(2)}');
}

