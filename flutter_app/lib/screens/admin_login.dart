import 'package:flutter/material.dart';
import 'admin_dashboard.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      label: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
          children: const [
            TextSpan(
              text: " *",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 18,
      ),
    );
  }

  void login() {
    if (!_formKey.currentState!.validate()) return;

    if (usernameController.text.trim() == "admin" &&
        passwordController.text.trim() == "admin123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AdminDashboard(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Username or Password"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: inputDecoration("Username"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter username";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: inputDecoration("Password"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}