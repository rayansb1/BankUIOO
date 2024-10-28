import 'package:bankui/model/customer.dart';

class Bank {
  List<Customer> customers = [];
  int nbm;
  Bank() : nbm = 0;

  bool addCustomer(Customer cc) {
    if (nbm >= 0) {
      customers.add(cc);
      nbm++;
      return true;
    } else {
      return false;
    }
  }

  bool removeCustomer(Customer cc) {
    if (nbm > 0) {
      customers.remove(cc);
      nbm--;
      return true;
    } else {
      return false;
    }
  }
}
