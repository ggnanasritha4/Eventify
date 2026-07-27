import 'package:flutter/material.dart';
import 'admin_events.dart';
import 'admin_registrations.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 30),

            const Icon(
              Icons.admin_panel_settings,
              size: 90,
            ),

            const SizedBox(height: 20),

            const Text(
              "Welcome Admin",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.event),
                label: const Text("Manage Events"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdminEvents(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.people),
                label: const Text("View Registrations"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdminRegistrations(),
                    ),
                  );
                },
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}