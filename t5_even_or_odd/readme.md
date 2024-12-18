# Random Number Categorizer in Dart

This Dart program generates a list of random numbers, categorizes them into even and odd numbers, and prints the categorized lists.

## Overview

The program performs the following steps:

1. Generates a list of 100 random numbers using the `Random` class.
2. Iterates over each number and classifies it as either even or odd.
3. Stores even and odd numbers in separate lists.
4. Prints the lists of even and odd numbers.

## Code Explanation

### Import Statement

```dart
import 'dart:math';
```

- The `dart:math` library is used to generate random numbers.

### Main Function

```dart
void main() {
  List<int> numbers = List.generate(100, (index) => Random(index).nextInt(100));
```

- **Generates 100 random numbers** ranging between 0 and 99.
- The `Random(index)` creates a predictable random number generator for each index.

### Lists for Even and Odd Numbers

```dart
List<int> odd = [];
List<int> even = [];
```

- Initializes empty lists to store even and odd numbers.

### Loop and Switch Statement

```dart
for (var number in numbers) {
  switch (number % 2) {
    case 0:
      even.add(number);
      break;
    default:
      odd.add(number);
  }
}
```

- Iterates through each number in the `numbers` list.
- Uses `switch` to check if the number is even or odd:
  - **Even numbers** (`number % 2 == 0`) are added to the `even` list.
  - **Odd numbers** are added to the `odd` list.

### Printing the Results

```dart
print('Even numbers: $even');
print('Odd numbers: $odd');
```

- Prints the lists of even and odd numbers.

## Sample Output

```
Even numbers: [34, 22, 46, 0, ...]
Odd numbers: [57, 13, 89, 1, ...]
```

(The actual numbers will vary based on the random generator.)