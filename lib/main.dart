import 'package:flutter/material.dart';
import 'pages/welcome/welcome_page.dart'; // Sesuaikan dengan path folder Anda

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sewa Mobil',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomePage(), // Aplikasi dimulai dari halaman Welcome
    );
  }
}
