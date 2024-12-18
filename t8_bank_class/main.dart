class BankAccount {
  late int accountId;
  int? balance;

  // Initializes the account with a null balance
  // (Account is not yet activated)
  BankAccount(this.accountId);

  // Initializes the account with a balance of 0
  BankAccount.balance(this.accountId) : this.balance = 0;

  // Withdraws the given amount from the account
  // If the balance is null, it prints "Account is closed"
  // If the balance is less than the amount, it prints "Insufficient balance"
  void withdraw(int amount) {
    if (this.balance == null) {
      print("Account is closed");
      return;
    }
    if (this.balance! < amount) {
      print("Insufficient balance");
      return;
    }
    print("Withdrawing $amount");
    this.balance = (this.balance ?? 0) - amount;
  }

  // Deposits the given amount to the account
  // If the balance is null, it prints "Account is closed"
  void deposit(int amount) {
    if (this.balance == null) {
      print("Account is closed");
      return;
    }
    print("Depositing $amount");
    this.balance = (this.balance ?? 0) + amount;
  }

  // Displays the account ID and balance
  // If the balance is null, it prints "There is no balance, account is closed"
  void displayInfo() {
    print("Account ID: ${this.accountId}");
    print("Balance: ${this.balance ?? "There is no balance, account is closed"}");
  }
}

void main() {
  BankAccount account1 = BankAccount(1); // Account ID: 1, Balance: There is no balance, account is closed
  account1.deposit(1000); // Account is closed
  account1.withdraw(500); // Account is closed
  account1.displayInfo(); // Account ID: 1, Balance: There is no balance, account is closed

  BankAccount account2 = BankAccount.balance(2); // Account ID: 2, Balance: 0
  account2.deposit(2000); // Depositing 2000
  account2.withdraw(1000); // Withdrawing 1000
  account2.displayInfo(); // Account ID: 2, Balance: 1000
  account2.withdraw(1500); // Insufficient balance
}
