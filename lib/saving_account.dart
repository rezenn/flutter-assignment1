import 'package:flutter_assignment_1/bank_account.dart';

class SavingAccount extends BankAccount implements InterestBearing {
  double _intrestRate = 2;
  final int _withdrawalLimit = 3;
  int _withdrawalCount = 0;

  SavingAccount(
    super._accountNumber,
    super._accHolderName,
    super._balance,
    this._intrestRate,
    int withdrawalLimit,
    this._withdrawalCount,
  );

  set setIntrestRate(double intrestRate) {
    _intrestRate = intrestRate;
  }

  double get intrestRate => _intrestRate;
  int get withdrawalLimit => _withdrawalLimit;
  int get withdrawalCount => _withdrawalCount;

  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print("The amount must be greater than 0.");
      return;
    }
    updateBalance(balance + amount);
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
    print("Withdrew $amount. The new balance is $balance.");
  }

  @override
  void applyInterest() {
    final intrestAmount = balance * (_intrestRate / 100);
    updateBalance(balance + intrestAmount);
    print("Intrest added: $intrestAmount. The new balance is $balance");
  }
}
