import 'package:calling/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:calling/widgets/app_bar.dart';
import 'package:calling/widgets/tab_buttons.dart';


class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBarPage(),
      body: Column(
        children: [
          SizedBox(height: 10,),
          TabButtonsPage(),
          Padding(
            padding: const EdgeInsets.only(top:10, bottom: 10, left: 0, right: 260),
            child: Text('All messages'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messageData.length,
              itemBuilder: (context, index) {
                final message = messageData[index];
                return MessageTile(
                  phoneNumber: message.phoneNumber,
                  message: message.message,
                  type: message.type,
                  time: message.time,
                  isTyping: message.isTyping,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
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

class MessageTile extends StatelessWidget {
  final String phoneNumber;
  final String message;
  final String type;
  final String time;
  final bool isTyping;

  const MessageTile({
    required this.phoneNumber,
    required this.message,
    required this.type,
    required this.time,
    this.isTyping = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Icon(Icons.person, color: Colors.blue),
      ),
      title: Row(
        children: [
          Text(phoneNumber, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: type == 'Personal' ? Colors.blue[50] : Colors.green[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(type, style: TextStyle(fontSize: 12)),
          ),
          if (!isTyping)
            Container(
              margin: EdgeInsets.only(left: 0),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Chat', style: TextStyle(fontSize: 12)),
            ),
        ],
      ),
      subtitle: Text(isTyping ? 'Typing...' : message),
      trailing: Text(time, style: TextStyle(color: Colors.grey)),
    );
  }
}

class MessageData {
  final String phoneNumber;
  final String message;
  final String type;
  final String time;
  final bool isTyping;

  MessageData({
    required this.phoneNumber,
    required this.message,
    required this.type,
    required this.time,
    this.isTyping = false,
  });
}

final messageData = [
  MessageData(
    phoneNumber: '+91 9685485260',
    message: 'Hi, Can you tell me your name...',
    type: 'Personal',
    time: '12:01 pm',
  ),
  MessageData(
    phoneNumber: 'Tejal',
    message: 'Hi, How are you?',
    type: 'Personal',
    time: 'Yesterday',
  ),
  MessageData(
    phoneNumber: 'Akshada',
    message: 'Hi, Can you tell me your name...',
    type: 'Business',
    time: '24/7/2024',
    isTyping: true,
  ),
  MessageData(
    phoneNumber: '+91 9685485260',
    message: 'Hi, Can you tell me your name...',
    type: 'Business',
    time: '24/7/2024',
    isTyping: true,
  ),
  MessageData(
    phoneNumber: '+91 9685..',
    message: 'Hi, Can you tell me your name...',
    type: 'BUsiness',
    time: '24/7/2024',
    isTyping: true,
  ),
  MessageData(
    phoneNumber: '+91 9685485260',
    message: 'Hi, Can you tell me your name...',
    type: 'Business',
    time: '22/6/2024',
    isTyping: true,
  ),
];
