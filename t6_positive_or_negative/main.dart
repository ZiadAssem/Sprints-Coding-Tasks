// Enter any integer number
// Use the condition to check it's positive or negative, then
// use the condition to check if it's even or odd

import 'dart:io';

void main() {
  //infinitive loop to check multiple numbers
  for (;;) {

    print('Enter any integer number');
    String? input = stdin.readLineSync();

    // check if the input is null or empty
    if (input == null || input.isEmpty) {
      print('Invalid input. Please enter a valid integer.');
      return;
    }

    // parse the input to integer
    int number = int.parse(input);

    // check if the number is positive, negative or zero
    if (number > 0) {
      print('The number is positive');
    } else if (number < 0) {
      print('The number is negative');
    } else {
      print('The number is zero');
    }


    // check if the number is even or odd
    if (number % 2 == 0) {
      print('The number is even');
    } else {
      print('The number is odd');
    }
  }
}
