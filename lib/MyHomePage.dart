import 'package:flutter/material.dart';
import 'package:calling/widgets/app_bar.dart';
import 'package:calling/widgets/bottom_navigation.dart';
import 'package:calling/widgets/tab_buttons.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // Index for Bottom Navigation Bar

  // Screens for Bottom Navigation
  final List<Widget> _pages = [
    Center(child: Text('Connects Page')),
    Center(child: Text('Dialpad Page')),
    Center(child: Text('Reachouts Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(),
      body: Column(
        children: [
          SizedBox(height: 10),
          TabButtonsPage(),  // Removed the context parameter here
          SizedBox(height: 20),
          Expanded(child: _pages[_currentIndex]), // Display current selected page
        ],
      ),
      bottomNavigationBar: BottomNavigationBarPage(
        currentIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
