import 'package:flutter_assignment_1/bank_account.dart';

class PremiumAccount extends BankAccount implements InterestBearing {
  double _intrestRate;

  PremiumAccount(
    super._accountNumber,
    super._accHolderName,
    super._balance, {
    double interestRate = 5,
  }) : _intrestRate = interestRate;

  double get interestRate => _intrestRate;

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

  @override
  void applyInterest() {
    final intrestAmount = balance * (_intrestRate / 100);
    updateBalance(balance + intrestAmount);
    print("Intrest added: $intrestAmount. The new balance is $balance");
  }
}
