import 'package:calling/MyHomePage.dart';
import 'package:flutter/material.dart';


class access_call extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/access_1.png', height: 350),
              SizedBox(height: 20),
              Text(
                'Access Your Call Logs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We need access to your contacts and call logs to \nhelp you connect and manage your \ncommunication seamlessly.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),

              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5864F8),
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                ),
                child: Text('Allow Access',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
