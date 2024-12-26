import 'package:calling/widgets/app_bar.dart';
import 'package:calling/widgets/bottom_navigation.dart';
import 'package:calling/widgets/tab_buttons.dart';
import 'package:flutter/material.dart';
import 'package:calling/widgets/CallLogTile.dart';

class Calls extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(),
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
                  callType: 'Outgoing',
                  time: '12:00 PM',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Tejal',
                  type: 'Personal',
                  icon: Icons.call_missed,
                  callType: 'Missed',
                  time: '12:00 PM',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Akshada',
                  type: 'Personal',
                  icon: Icons.call_received,
                  callType: 'Incoming',
                  time: '12:00 PM',
                  isSpam: false,
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Personal',
                  icon: Icons.report,
                  callType: 'Spam',
                  time: '12:00 PM',
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
                  callType: 'Outgoing',
                  time: '12:00 PM',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Tejal',
                  type: 'Personal',
                  icon: Icons.call_missed_outgoing,
                  callType: 'Missed',
                  time: '12:00 PM',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Akshada',
                  type: 'Business',
                  icon: Icons.call_received,
                  callType: 'Incoming',
                  time: '12:00 PM',
                  isSpam: false,
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Personal',
                  icon: Icons.report,
                  callType: 'Spam',
                  time: '12:00 PM',
                  isSpam: true,
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Personal',
                  icon: Icons.report,
                  callType: 'Spam',
                  time: '12:00 PM',
                  isSpam: true,
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Personal',
                  icon: Icons.report,
                  callType: 'Spam',
                  time: '12:00 PM',
                  isSpam: true,
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
}