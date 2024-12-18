import 'dart:math';

void main() {
  // generates a list of random numbers
  List<int> numbers = List.generate(100, (index) => Random(index).nextInt(100));

  // lists to place even and odd numbers
  List<int> odd = [];
  List<int> even = [];

  // loops on all numbers
  for (var number in numbers) {
    // divides the number by 2
    switch (number % 2) {
      // if the remainder is zero, the number is even
      case 0:
        even.add(number);
        break;
      // else the value is odd
      default:
        odd.add(number);
    }
  }

  //prints the lists
  print('Even numbers: $even');
  print('Odd numbers: $odd');
}
