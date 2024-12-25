import 'package:flutter/material.dart';
import 'package:calling/widgets/app_bar.dart';
import 'package:calling/widgets/bottom_navigation.dart';
import 'package:calling/widgets/tab_buttons.dart';

class favourite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  int _currentIndex = 0;

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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            TabButtonsPage(),
            SizedBox(height: 300),
            Center(child: Text('Favourite Page'))
          ],
        ),
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
