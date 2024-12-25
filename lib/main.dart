import 'package:calling/calls.dart';
import 'package:calling/contacts.dart';
import 'package:calling/message_screen.dart';
import 'package:calling/profile.dart';
import 'package:calling/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context) => splashScreen(),
        '/': (context) => Calls(),
        '/contacts': (context) => Contacts(),
        '/messages': (context) => MessagesScreen(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
