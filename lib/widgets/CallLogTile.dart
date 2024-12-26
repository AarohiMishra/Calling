import 'package:flutter/material.dart';

class CallLogTile extends StatelessWidget {
  final String name;
  final String type;
  final IconData icon;
  final String callType;
  final String time;
  final bool isSpam;

  CallLogTile({
    required this.name,
    required this.type,
    required this.icon,
    required this.callType,
    required this.time,
    required this.isSpam,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isSpam ? Colors.red : Colors.blue,
        child: Icon(
          isSpam ? Icons.report : Icons.person,
          color: Colors.white,
        ),
      ),
      title: Row(
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: type == 'Personal' ? Colors.blue[50] : Colors.green[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(type, style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: (callType == 'Missed' || callType == 'Spam') ? Colors.red : Colors.green,
          ),
          SizedBox(width: 5),
          Text(callType),
          Spacer(),
          Text(time),
        ],
      ),
      trailing: Icon(
        Icons.info_outline,
        color: Colors.grey,
      ),
    );
  }
}
