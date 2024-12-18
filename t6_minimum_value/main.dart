import 'dart:math';

void main() {
  // generates a list of random numbers
  List<int> numbers = List.generate(100, (index) => Random().nextInt(100));

  // empty list for edge cases
  List<int> empty = [];

  findMinimum(numbers);
}

void findMinimum(List<int> numbers){
  // edge case if list is empty
  if(numbers.length<1){
    print('the list is empty');
    return;
  }

  // starts with the first value as minimum
  int minimum = numbers[0];

  // compares all values with min values
  // if it is less, it is now the new minimum
  for (int number in numbers) {
    if(number < minimum){
      minimum = number;
    }
  }
  print('the minimum value is $minimum');
}
