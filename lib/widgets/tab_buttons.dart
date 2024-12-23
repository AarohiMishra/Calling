import 'package:calling/calls.dart';
import 'package:calling/contacts.dart';
import 'package:calling/favouritePage.dart';
import 'package:flutter/material.dart';
import 'package:calling/message_screen.dart'; // Import MessagesScreen

class TabButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 10),
          _buildTabButton(context, 'Calls', Icons.keyboard_arrow_down_outlined, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Calls()),
            );
          }),
          SizedBox(width: 10),
          _buildTabButton(context, 'Contacts', Icons.keyboard_arrow_down_outlined, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Contacts()),
            );
          }),
          SizedBox(width: 10),
          _buildTabButton(context, 'Messages', Icons.keyboard_arrow_down_outlined, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MessagesScreen()), // Navigate to MessageScreen
            );
          }),
          SizedBox(width: 10),
          _buildTabButton(context, 'Favorites', Icons.keyboard_arrow_down_outlined, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => favourite()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: () {
        if (title == 'Messages') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Column(
                children: [
                  Icon(Icons.messenger_outline, size: 40),
                  SizedBox(height: 10),
                  Text('Allow Permissions',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                ],
              ),
              content: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Allow ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextSpan(
                      text: 'DialerX',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextSpan(
                      text: ' to send and \nview SMS messages',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MessagesScreen()),
                      );
                    },
                    child: Text('Allow',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
          );
        } else {
          onPressed();
        }
      },
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
