import 'package:flutter_assignment_1/bank.dart';
import 'package:flutter_assignment_1/bank_account.dart';
import 'package:flutter_assignment_1/checking_account.dart';
import 'package:flutter_assignment_1/premium_account.dart';
import 'package:flutter_assignment_1/saving_account.dart';
import 'package:flutter_assignment_1/student_account.dart';

void main() {
  final bank = Bank('ABC Bank');

  final savings = SavingAccount(1001, 'Hari', 1200);
  final checking = CheckingAccount(2001, 'Ram', 100);
  final premium = PremiumAccount(3001, 'Shyam', 20000);
  final student = StudentAccount(4001, 'Jay', 500);

  bank.createAccount(savings);
  bank.createAccount(checking);
  bank.createAccount(premium);
  bank.createAccount(student);

  savings.displayInfo();

  bank.generateReport();

  print("Transactions");
  savings.withdraw(100);
  checking.withdraw(120);
  premium.withdraw(5000);
  savings.applyInterest();
  premium.applyInterest();
  student.deposit(100);

  bank.transfer(1001, 3001, 200);
  print("Transfered: from Hari to Shyam \$200.");

  bank.generateReport();

  showTransactions();
}
