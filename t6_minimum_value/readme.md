# Minimum Value Finder in Dart

This Dart program generates a list of random numbers, finds the minimum value in the list, and handles the edge case where the list might be empty.

## Overview

The program performs the following steps:

1. Generates a list of 100 random numbers.
2. Defines a function to find the minimum value in the list.
3. Handles the case where the list is empty.
4. Prints the minimum value.

## Code Explanation

### Import Statement

```dart
import 'dart:math';
```

- The `dart:math` library is used to generate random numbers.

### Main Function

```dart
void main() {
  List<int> numbers = List.generate(100, (index) => Random().nextInt(100));

  // Empty list for edge cases
  List<int> empty = [];

  findMinimum(numbers);
}
```

- Generates a list of 100 random numbers between 0 and 99.
- Calls the `findMinimum` function to find the minimum value in the `numbers` list.

### Find Minimum Function

```dart
void findMinimum(List<int> numbers){
  if (numbers.length < 1) {
    print('the list is empty');
    return;
  }

  int minimum = numbers[0];

  for (int number in numbers) {
    if (number < minimum) {
      minimum = number;
    }
  }
  print('the minimum value is $minimum');
}
```

- **Edge Case Handling**: If the list is empty, it prints a message and returns.
- **Finding Minimum**: Starts with the first element as the minimum and iterates through the list to find the smallest number.

### Sample Output

```
the minimum value is 3
```

(The actual minimum value will vary based on the random numbers generated.)