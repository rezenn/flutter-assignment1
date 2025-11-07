import 'package:flutter_assignment_1/bank_account.dart';

class StudentAccount extends BankAccount {
  final double _maxBalance = 5000;

  StudentAccount(int accountNumber, String accHolderName, double balance)
    : super(accountNumber, accHolderName, balance);

  @override
  void deposit(double amount) {
    if (balance + amount > _maxBalance) {
      print("The balance cannot be greater than 5000.");
    }
    updateBalance(balance + amount);
    addTransaction(
      'Account: $accountNumber | Deposited: ${amount.toStringAsFixed(2)} | Balance: $balance',
    );
    print("Deposited $amount. The new balance is $balance.");
  }

  @override
  void withdraw(double amount) {
    if (amount > balance) {
      print("Insufficient balance.");
      return;
    }
    updateBalance(balance - amount);
    addTransaction('Account: $accountNumber | Withdrew: ${amount.toStringAsFixed(2)} | Balance: $balance');
    print("Withdrew $amount. The new balance is $balance.");
  }
}
