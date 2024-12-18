# Grocery Item Price Calculator in Dart

This Dart program calculates the total price of grocery items, applies a fixed tax rate, and prints both the total price before and after tax.

## Overview

The program performs the following steps:

1. Defines a list of grocery items, each represented as a map with a name and a price.
2. Loops through the list to sum up the prices.
3. Applies a constant tax rate (10%).
4. Prints the total price before tax and the total price after tax.

## Code Explanation

### Constant Tax Rate

```dart
const double taxRate = 0.10;
```

- A fixed tax rate of 10% is applied to the total price.

### List of Grocery Items

```dart
List<Map<String, dynamic>> groceryItems = [
  {'name': 'Milk', 'price': 3.5},
  {'name': 'Bread', 'price': 2.0},
  {'name': 'Eggs', 'price': 2.5},
  {'name': 'Cheese', 'price': 4.0},
];
```

- Each grocery item is represented as a map with `name` and `price` keys.

### Calculate Total Price

```dart
double totalPrice = 0.0;

for (var item in groceryItems) {
  totalPrice += item['price'];
}
```

- Iterates through the `groceryItems` list and sums up the prices.

### Calculate Total Price with Tax

```dart
double totalWithTax = totalPrice + (totalPrice * taxRate);
```

- Adds the tax to the total price.

### Print the Results

```dart
print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
print('Total Price with Tax: \$${totalWithTax.toStringAsFixed(2)}');
```

- Prints the total price before and after applying the tax.

## Sample Output

```
Total Price: $12.00
Total Price with Tax: $13.20
```