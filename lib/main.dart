import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:hunian_app/controllers/auth_controller.dart';
import 'package:hunian_app/controllers/kost_controller.dart';
import 'package:hunian_app/core/storage/storage_service.dart';
import 'package:hunian_app/screens/auth/login_screen.dart';
import 'package:hunian_app/screens/home/home_screen.dart';
import 'package:hunian_app/services/notification_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageService().init();
  await NotificationService().init();

  final bool isLoggedIn = StorageService().getIsLoggedIn();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => KostController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hunian',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          useMaterial3: true,
        ),
        home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
