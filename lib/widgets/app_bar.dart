import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarPage({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset(
            'assets/logo_appbar.png',
            height: 30,
            width: 30,
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SUREFY.AI',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'always be sure',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 8,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.grey.shade700),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_sharp, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
