import 'package:flutter/material.dart';
import 'screens/LoginScreen.dart';
import 'screens/HomeScreen.dart';
import 'screens/RevenueScreen.dart';
import 'screens/OrderManagementScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
