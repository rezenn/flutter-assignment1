import 'package:flutter_assignment_1/bank_account.dart';

class Bank {
  final String name;
  final Map<int, BankAccount> _accounts = {};

  Bank(this.name);

  bool createAccount(BankAccount account) {
    if (_accounts.containsKey(account.accountNumber)) {
      print('Bank Account ${account.accountNumber} already exists.');
      return false;
    }
    _accounts[account.accountNumber] = account;
    print(
      'Bank Account ${account.accountNumber} created for ${account.accHolderName}.',
    );
    return true;
  }

  BankAccount? findAccount(int accountNumber) => _accounts[accountNumber];

  bool transfer(int fromAccNum, int toAccNum, double amount) {
    if (amount <= 0) {
      print('Bank Transfer amount must be positive.');
      return false;
    }

    final fromAcc = findAccount(fromAccNum);
    final toAcc = findAccount(toAccNum);

    if (fromAcc == null) {
      print('Bank Source account $fromAccNum not found.');
      return false;
    }
    if (toAcc == null) {
      print('Bank Destination account $toAccNum not found.');
      return false;
    }

    final double beforeWithdrawBalance = fromAcc.balance;

    print(
      'Bank Initiating transfer of $amount '
      'from $fromAccNum to $toAccNum.',
    );

    fromAcc.withdraw(amount);

    // If balance didn't decrease, withdrawal failed
    if (fromAcc.balance == beforeWithdrawBalance) {
      print('Bank Transfer aborted: withdrawal from $fromAccNum failed.');
      return false;
    }

    toAcc.deposit(amount);
    print('Bank Transfer completed.');

    return true;
  }

  // Apply interest to all interest-bearing accounts
  void applyInterestToAll() {
    _accounts.forEach((_, account) {
      if (account is InterestBearing) {
        (account as InterestBearing).applyInterest();
      }
    });
  }

  void generateReport() {
    print('=== Bank Report: $name ===');
    if (_accounts.isEmpty) {
      print('No accounts found.');
      return;
    }
    _accounts.forEach((accNum, account) {
      print('--- Account Info ---');
      account.displayInfo();
    });
    print('End Report');
  }
}
