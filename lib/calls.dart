import 'package:calling/widgets/app_bar.dart';
import 'package:calling/widgets/bottom_navigation.dart';
import 'package:calling/widgets/tab_buttons.dart';
import 'package:flutter/material.dart';
import 'package:calling/widgets/CallLogTile.dart';
import 'package:calling/contacts.dart';
import 'package:calling/message_screen.dart';
import 'package:calling/profile.dart'; // Added for Profile navigation
import 'package:calling/dial_page.dart'; // Added for Dialpad navigation

class Calls extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  int _currentIndex = 0; // To control navigation to different screens (calls, contacts, messages, etc.)

  // Screens for Bottom Navigation (Updated for tab buttons usage)
  final List<Widget> _pages = [
    Center(child: Text('Connects Page')),
    DialPage(onDialButtonPressed: (String value) {}),
    Center(child: Text('Reachouts Page')),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(), // Use custom AppBarPage widget here
      body: Column(
        children: [
          SizedBox(height: 10),
          TabButtonsPage(),
          SizedBox(height: 25),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Today'),
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Business',
                  icon: Icons.call_made,
                  time: '12:00 PM',
                  callType: 'Outgoing',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Tejal',
                  type: 'Personal',
                  icon: Icons.call_missed,
                  time: '12:00 PM',
                  callType: 'Missed',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Akshada',
                  type: 'Personal',
                  icon: Icons.call_received,
                  time: '12:00 PM',
                  callType: 'Incoming',
                  isSpam: false,
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Personal',
                  icon: Icons.report,
                  time: '12:00 PM',
                  callType: 'Spam',
                  isSpam: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Older'),
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Business',
                  icon: Icons.call_made,
                  time: '12:00 PM',
                  callType: 'Outgoing',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Tejal',
                  type: 'Personal',
                  icon: Icons.call_missed_outgoing,
                  time: '12:00 PM',
                  callType: 'Missed',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Akshada',
                  type: 'Business',
                  icon: Icons.call_received,
                  time: '12:00 PM',
                  callType: 'Incoming',
                  isSpam: false,
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Personal',
                  icon: Icons.report,
                  time: '12:00 PM',
                  callType: 'Spam',
                  isSpam: false,
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Personal',
                  icon: Icons.report,
                  time: '12:00 PM',
                  callType: 'Spam',
                  isSpam: false,
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Personal',
                  icon: Icons.report,
                  time: '12:00 PM',
                  callType: 'Spam',
                  isSpam: false,
                ),
              ],
            ),
          ),
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

  // Helper Widget to Build Tab Buttons
  Widget _buildTabButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
          SizedBox(width: 4),
          Icon(icon, color: Colors.blue),
        ],
      ),
    );
  }
}
