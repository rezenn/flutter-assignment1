import 'package:flutter_assignment_1/bank_account.dart';

class CheckingAccount extends BankAccount {
  final double _overdraft;

  CheckingAccount(
    super._accountNumber,
    super._accHolderName,
    super._balance, {
    double overdraft = 35,
  }) : _overdraft = overdraft;

  double get overdraft => _overdraft;

  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print("The amount must be greater than 0.");
    }
    updateBalance(balance + amount);
    print("Deposited $amount. The new balance is $balance.");
  }

  @override
  void withdraw(double amount) {
    if (amount <= 0) {
      print("The amount cannot be less than 0.");
      return;
    }
    updateBalance(balance - amount);
    print("Withdrew $amount. The new balance is $balance.");

    if (balance < 0) {
      updateBalance(balance - _overdraft);
      print("Overdraft! $_overdraft fee applied. New balance is $balance");
    }
  }
}
