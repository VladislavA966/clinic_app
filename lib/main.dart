import 'package:flutter/material.dart';
import 'package:flutter_application_6/presenatiton/pages/user_auth_screens/user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.white, elevation: 2),
      ),
      debugShowCheckedModeBanner: false,
      home: UserProfile(),
    );
  }
}
