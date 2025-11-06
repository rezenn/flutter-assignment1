abstract class BankAccount {
  int _accountNumber;
  String _accHolderName;
  double _balance;

  BankAccount(this._accountNumber, this._accHolderName, this._balance);

  set setAccountNumber(int accountNumber) {
    _accountNumber = accountNumber;
  }

  set setAccHolderName(String accHolderName) {
    _accHolderName = accHolderName;
  }

  set setBalance(double balance) {
    _balance = balance;
  }

  int get accountNumber => _accountNumber;
  String get accHolderName => _accHolderName;
  double get balance => _balance;

  void withdraw(double amount);
  void deposit(double amount);
  void updateBalance(double newBalance) {
    _balance = newBalance;
  }

  void displayInfo() {
    print("Account Number: $_accountNumber.");
    print("Account Holder: $_accHolderName.");
    print("Balance: $_balance.");
  }

  @override
  String toString() =>
      'Account No: $_accountNumber | Holder: $_accHolderName | Balance: \$${_balance.toStringAsFixed(2)}';
}

abstract class InterestBearing {
  void applyInterest();
}
