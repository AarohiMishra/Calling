import 'package:calling/widgets/app_bar.dart';
import 'package:calling/widgets/bottom_navigation.dart';
import 'package:calling/widgets/tab_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reachouts extends StatefulWidget{
  @override
  State<Reachouts> createState() => _ReachoutsState();
}

class _ReachoutsState extends State<Reachouts> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarPage(),
      body: Column(
        children: [
          SizedBox(height: 10),
          TabButtonsPage(),
          SizedBox(height: 270,),
          Center(child: Text("Reachouts")),
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