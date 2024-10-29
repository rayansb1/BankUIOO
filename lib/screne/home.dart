import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  borderRadius: BorderRadius.circular(10), // Rounded corners
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
    );
  }
}
