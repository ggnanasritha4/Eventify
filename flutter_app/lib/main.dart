import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

// Change this import according to your actual home file
import 'screens/home_screen.dart';

void main() {
  runApp(const EventRegistrationApp());
}

class EventRegistrationApp extends StatelessWidget {

  const EventRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Eventify",

      theme: AppTheme.lightTheme,

      home: const HomeScreen(),

    );
  }
}