import 'package:flutter_assignment_1/bank.dart';
import 'package:flutter_assignment_1/checking_account.dart';
import 'package:flutter_assignment_1/premium_account.dart';
import 'package:flutter_assignment_1/saving_account.dart';

void main() {
  final bank = Bank('Example Bank');

  final savings = SavingAccount(1001, 'Alice', 1200);
  final checking = CheckingAccount(2001, 'Bob', 100);
  final premium = PremiumAccount(3001, 'Carol', 20000);

  bank.createAccount(savings);
  bank.createAccount(checking);
  bank.createAccount(premium);

  bank.generateReport();

  print("\n-- Transactions --\n");
  savings.withdraw(100);
  checking.withdraw(120);
  premium.withdraw(5000);
  savings.applyInterest();
  premium.applyInterest();

  print("\n-- Transfer (Alice -> Carol \$200) --\n");
  bank.transfer(1001, 3001, 200);

  print("\n-- Final Report --\n");
  bank.generateReport();
}
