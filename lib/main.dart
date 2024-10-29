import 'package:bankui/model/bank.dart';
import 'package:bankui/model/customer.dart';
import 'package:flutter/material.dart';

void main() {
  // Initialize the Bank and add Customer instances inside main
  Bank raybank = Bank();
  Customer c1 = Customer("Rayan", "A1211", 99999999999.99);
  raybank.addCustomer(c1);

  runApp(MyApp(bank: raybank)); // Pass the bank instance to MyApp
}

class MyApp extends StatelessWidget {
  final Bank bank;

  const MyApp({super.key, required this.bank});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(bank: bank),
    );
  }
}

class LoginPage extends StatelessWidget {
  final Bank bank;
  final nameController = TextEditingController();
  final accountIdController = TextEditingController();

  LoginPage({super.key, required this.bank});

  void _login(BuildContext context) {
    // Check if there’s a customer in the bank with the entered name and account ID
    bool isCustomerValid = bank.customers.any((c1) =>
        c1.Name == nameController.text &&
        c1.AccountID == accountIdController.text);

    if (isCustomerValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid name or account ID")),
      );
    }
  }

  void _signUp(BuildContext context) {
    // Implement sign-up functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Sign-up functionality not implemented")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ray Bank",
            style: TextStyle(fontSize: 23, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 68, 97),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to our app", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter your name",
                labelStyle: const TextStyle(
                    color: Color.fromARGB(
                        255, 64, 64, 64)), // Dark blue label color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue[800]!,
                      width: 2), // Border color when enabled
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 2), // Border color when focused
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: accountIdController,
              decoration: InputDecoration(
                labelText: "Enter your Account ID",
                labelStyle: const TextStyle(
                    color: Color.fromARGB(
                        255, 64, 64, 64)), // Dark blue label color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue[800]!,
                      width: 2), // Border color when enabled
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 2), // Border color when focused
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromRGBO(12, 153, 209, 1), // button color
                foregroundColor: Colors.white, // text color
              ),
              child: const Text("Log in", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _signUp(context),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 8, 54, 103), // button color
                foregroundColor: Colors.white, // text color
              ),
              child: const Text("Sign up", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Successful")),
      body: const Center(
        child: Text("Welcome!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
