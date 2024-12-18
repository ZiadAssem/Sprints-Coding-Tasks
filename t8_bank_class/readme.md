# BankAccount Class in Dart

This Dart code defines a `BankAccount` class with methods to manage a simple bank account, including deposits, withdrawals, and displaying account information. It also handles cases where the account is closed (balance is `null`).

---

## Table of Contents

1. [Overview](#overview)
2. [Class Structure](#class-structure)
   - [Variables](#variables)
   - [Constructors](#constructors)
   - [Methods](#methods)
3. [Usage Example](#usage-example)
4. [Code](#code)

---

## Overview

The `BankAccount` class allows for creating bank accounts with two types of initial states:

1. **Account with a null balance** (account not yet activated).
2. **Account with an initial balance of 0** (ready for transactions).

The class supports operations like:

- Depositing money
- Withdrawing money
- Displaying account information
- Handling edge cases such as insufficient balance or a closed account

---

## Class Structure

### Variables

- **`accountId`** (`int`): The unique identifier for the account.
- **`balance`** (`int?`): The balance of the account, which can be `null` if the account is closed.

### Constructors

1. **Default Constructor**:
   ```dart
   BankAccount(this.accountId);
   ```
   - Initializes the account with a `null` balance.

2. **Named Constructor**:
   ```dart
   BankAccount.balance(this.accountId) : this.balance = 0;
   ```
   - Initializes the account with a balance of `0`.

### Methods

1. **`withdraw(int amount)`**:
   - Withdraws a specified amount from the account.
   - Prints "Account is closed" if the balance is `null`.
   - Prints "Insufficient balance" if the balance is less than the withdrawal amount.

2. **`deposit(int amount)`**:
   - Deposits a specified amount into the account.
   - Prints "Account is closed" if the balance is `null`.

3. **`displayInfo()`**:
   - Displays the account ID and current balance.
   - If the balance is `null`, it prints "There is no balance, account is closed".

---

## Usage Example

### Code Execution Output

```plaintext
Account is closed
Account is closed
Account ID: 1
Balance: There is no balance, account is closed
Depositing 2000
Withdrawing 1000
Account ID: 2
Balance: 1000
Insufficient balance
```

### Explanation

1. **Account 1** is created with a `null` balance and cannot perform deposits or withdrawals.
2. **Account 2** is initialized with a balance of `0`, allowing transactions like deposits and withdrawals.

---

## Code

```dart
class BankAccount {
  late int accountId;
  int? balance;

  // Initializes the account with a null balance
  BankAccount(this.accountId);

  // Initializes the account with a balance of 0
  BankAccount.balance(this.accountId) : this.balance = 0;

  // Withdraws the given amount from the account
  void withdraw(int amount) {
    if (this.balance == null) {
      print("Account is closed");
      return;
    }
    if (this.balance! < amount) {
      print("Insufficient balance");
      return;
    }
    print("Withdrawing \$amount");
    this.balance = (this.balance ?? 0) - amount;
  }

  // Deposits the given amount to the account
  void deposit(int amount) {
    if (this.balance == null) {
      print("Account is closed");
      return;
    }
    print("Depositing \$amount");
    this.balance = (this.balance ?? 0) + amount;
  }

  // Displays the account ID and balance
  void displayInfo() {
    print("Account ID: ${this.accountId}");
    print("Balance: ${this.balance ?? "There is no balance, account is closed"}");
  }
}

void main() {
  BankAccount account1 = BankAccount(1);
  account1.deposit(1000);
  account1.withdraw(500);
  account1.displayInfo();

  BankAccount account2 = BankAccount.balance(2);
  account2.deposit(2000);
  account2.withdraw(1000);
  account2.displayInfo();
  account2.withdraw(1500);
}
```

---

## Key Points

- **Account Activation**: The account needs to have a balance of `0` or more to perform transactions.
- **Error Handling**: The code checks for conditions like closed accounts and insufficient funds before performing actions.

---

Happy Coding! 😊
