import 'package:bankui/model/bank.dart';
import 'package:flutter/material.dart';
import 'package:bankui/model/customer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Bank b1 = Bank();

    // Creating customer instances
    Customer c1 = Customer("Rayan", "A12312", 9999999999.99);
    Customer c2 = Customer("Rakan", "A12313", 9999999999.99);
    Customer c3 = Customer("Mohammed", "A12314", 9999999999.99);
    Customer c4 = Customer("Khalid", "A12315", 9999999999.99);
    Customer c5 = Customer("Suliman", "A12316", 9999999999.99);

    // Adding customers to the bank
    b1.addCustomer(c1);
    b1.addCustomer(c2);
    b1.addCustomer(c3);
    b1.addCustomer(c4);
    b1.addCustomer(c5);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ray Bank",
            style: TextStyle(fontSize: 23),
          ),
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: const Color.fromARGB(255, 0, 68, 97),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50), // Adjust spacing as needed
              ...b1.customers.map((customer) {
                // Create a list of widgets for each customer
                String balanceString = customer.getBalance.toString();

                final gradientColors = [
                  Colors.blueAccent,
                  Colors.lightBlueAccent,
                ];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          "Hello ${customer.getName}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text("Your Account Number is ${customer.getAccountId}",
                            style: const TextStyle(color: Colors.white)),
                        Text("Your Balance is: $balanceString SR",
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
