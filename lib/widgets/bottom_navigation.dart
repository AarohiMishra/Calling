import 'package:flutter/material.dart';
import 'package:calling/dial_page.dart';
import 'package:calling/profile.dart';

class BottomNavigationBarPage extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChange;

  BottomNavigationBarPage({required this.currentIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onTabChange(index);
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DialPage(onDialButtonPressed: (String value) { })),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF5864F8),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt),
          label: 'Connects',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dialpad_outlined),
          label: 'Dialpad',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets_outlined),
          label: 'Reachouts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
