import 'package:calling/widgets/app_bar.dart';
import 'package:calling/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';


class DialPage extends StatefulWidget {
  final ValueChanged<String> onDialButtonPressed;


  const DialPage({
    Key? key,
    required this.onDialButtonPressed,
  }) : super(key: key);

  @override
  _DialPageState createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  String dialedNumber = '';
  int _currentIndex = 1;
  TextEditingController textController = TextEditingController();

  void updateNumber(String number) {
    setState(() {
      dialedNumber += number;
      textController.text = dialedNumber;
    });
    widget.onDialButtonPressed(dialedNumber); // Pass updated number back to parent widget
  }

  void clearLastDigit() {
    setState(() {
      if (dialedNumber.isNotEmpty) {
        dialedNumber = dialedNumber.substring(0, dialedNumber.length - 1);
        textController.text = dialedNumber;
      }
    });
    widget.onDialButtonPressed(dialedNumber); // Pass updated number back to parent widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(),  // Use the custom AppBarPage
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: textController,
              enabled: false,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: clearLastDigit,
                  icon: Icon(Icons.cancel_presentation_outlined),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Your dial pad buttons
          _buildDialPadRow(['1', '2', '3']),
          Divider(),
          _buildDialPadRow(['4', '5', '6']),
          Divider(),
          _buildDialPadRow(['7', '8', '9']),
          Divider(),
          _buildDialPadRow(['*', '0', '#']),
          Divider(),
          SizedBox(height: 80),
        ],
      ),
    );
  }

  // Helper function to create rows for the dial pad
  Row _buildDialPadRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((button) {
        return DialPadButton(
          label: button,
          onPressed: () => updateNumber(button),
        );
      }).toList(),
    );
  }
}

class DialPadButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const DialPadButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
