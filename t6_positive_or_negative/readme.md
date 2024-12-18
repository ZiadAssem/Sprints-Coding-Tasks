# Dart Program: Positive/Negative and Even/Odd Checker with Infinite Loop

This Dart program allows users to enter multiple integer numbers and checks whether each number is **positive, negative, or zero** and whether it is **even or odd**. The program runs indefinitely, allowing repeated checks until an invalid input is entered.

---

## 📝 **Code Explanation**

### Overview

The program performs the following steps:

1. **Takes user input** for an integer.
2. **Validates the input** to ensure it is not null or empty.
3. **Checks if the number** is:
   - Positive
   - Negative
   - Zero
4. **Determines if the number** is:
   - Even
   - Odd
5. Repeats the process using an **infinite loop** to allow multiple checks.

---

## 💻 **Code**

```dart
import 'dart:io';

void main() {
  // Infinite loop to check multiple numbers
  for (;;) {
    print('Enter any integer number');
    String? input = stdin.readLineSync();

    // Check if the input is null or empty
    if (input == null || input.isEmpty) {
      print('Invalid input. Please enter a valid integer.');
      return;
    }

    // Parse the input to integer
    int number = int.parse(input);

    // Check if the number is positive, negative, or zero
    if (number > 0) {
      print('The number is positive');
    } else if (number < 0) {
      print('The number is negative');
    } else {
      print('The number is zero');
    }

    // Check if the number is even or odd
    if (number % 2 == 0) {
      print('The number is even');
    } else {
      print('The number is odd');
    }
  }
}
```

---

## ✅ **Sample Output**

### Example 1: Positive Odd Number

```
Enter any integer number
5
The number is positive
The number is odd
```

### Example 2: Negative Even Number

```
Enter any integer number
-4
The number is negative
The number is even
```

### Example 3: Zero

```
Enter any integer number
0
The number is zero
The number is even
```

### Invalid Input

```
Enter any integer number

Invalid input. Please enter a valid integer.
```

---

## 🌟 **Features**

- **Infinite Loop**: Allows users to input multiple numbers without restarting the program.
- **Input Validation**: Ensures the user enters a valid integer.
- **Condition Checks**:
  - Identifies if the number is positive, negative, or zero.
  - Determines if the number is even or odd.

---

## 📝 **Notes**

- The program will terminate if an invalid input (e.g., empty input) is provided.
- The infinite loop (`for (;;)`) ensures that users can repeatedly input numbers until they choose to exit by entering invalid input.

---