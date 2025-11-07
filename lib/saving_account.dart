import 'package:flutter_assignment_1/bank_account.dart';

class SavingAccount extends BankAccount implements InterestBearing {
  double _interestRate;
  final int _withdrawalLimit = 3;
  int _withdrawalCount;

  SavingAccount(
    super._accountNumber,
    super._accHolderName,
    super._balance, {
    double interestRate = 2,
    int withdrawalCount = 0,
  }) : _interestRate = interestRate,
       _withdrawalCount = withdrawalCount;

  double get intrestRate => _interestRate;
  int get withdrawalLimit => _withdrawalLimit;
  int get withdrawalCount => _withdrawalCount;

  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print("The amount must be greater than 0.");
      return;
    }
    updateBalance(balance + amount);
    addTransaction(
      'Account: $accountNumber | Deposited: ${amount.toStringAsFixed(2)} | Balance: $balance',
    );

    print("Deposited $amount. The new balance is $balance.");
  }

  @override
  void withdraw(double amount) {
    if (_withdrawalCount >= _withdrawalLimit) {
      print("The withdrawal limit has been reached.");
      return;
    }
    if (balance - amount <= 500) {
      print("The mimimum balance cannot be less than 500.");
      return;
    }
    updateBalance(balance - amount);
    _withdrawalCount++;
    addTransaction('Account: $accountNumber | Withdrew: ${amount.toStringAsFixed(2)} | Balance: $balance');
    print("Withdrew $amount. The new balance is $balance.");
  }

  @override
  void applyInterest() {
    final intrestAmount = balance * (_interestRate / 100);
    updateBalance(balance + intrestAmount);
    print("Intrest added: $intrestAmount. The new balance is $balance");
  }
}
