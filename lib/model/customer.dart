class Customer {
  late String Name;
  late String AccountID;
  late double Balance;
  Customer(String nn, String aa, double bb) {
    this.Name = nn;
    this.AccountID = aa;
    this.Balance = bb;
  }
  // Getters for name, accountId, and balance
  String get getName => Name;
  String get getAccountId => AccountID;
  double get getBalance => Balance;

  bool Deposit(double money) {
    if (money > 0) {
      Balance += money;
      return true;
    } else {
      return false;
    }
  }

  bool Withdraw(double money) {
    if (Balance >= money) {
      Balance -= money;
      return true;
    } else {
      return false;
    }
  }
}
