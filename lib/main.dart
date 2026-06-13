import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:hunian_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hunian',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
