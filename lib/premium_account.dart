import 'package:flutter_assignment_1/bank_account.dart';

class PremiumAccount extends BankAccount {
  double _intrestRate = 5;

  PremiumAccount(
    super._accountNumber,
    super._accHolderName,
    super._balance,
    this._intrestRate,
  );

  set setIntrestRate(double intrestRate) {
    _intrestRate = intrestRate;
  }

  double get intrestRate => _intrestRate;

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
    if (balance - amount <= 10000) {
      print("The amount cannot be less than 10000.");
      return;
    }
    updateBalance(balance - amount);
    print("Withdrew $amount. The new balance is $balance.");
  }

  void applyIntrest() {
    final intrestAmount = balance * (_intrestRate / 100);
    updateBalance(balance + intrestAmount);
    print("Intrest added: $intrestAmount. The new balance is $balance");
  }
}
