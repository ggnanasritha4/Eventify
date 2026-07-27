import 'package:flutter/material.dart';
import 'events_screen.dart';
import 'admin_login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eventify"),
       
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EventsScreen(),
                ),
              );
            },
            child: const Text(
              "Events",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminLogin(),
                ),
              );
            },
            child: const Text(
              "Admin",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Eventify",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Manage and Register for Events Easily",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EventsScreen(),
                    ),
                  );
                },
                child: const Text("Explore Events"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}