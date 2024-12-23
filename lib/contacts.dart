import 'package:calling/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:calling/widgets/app_bar.dart';
import 'package:calling/widgets/tab_buttons.dart';

class Contacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  int _currentIndex = 0; // To manage the bottom navigation bar index
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(), // Use AppBarPage here
      body: Column(
        children: [
          TabButtonsPage(), // Ensure TabButtonsPage appears just below the app bar
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildContactsList(),
                ),
                _buildAlphabetStrip(),
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

  Widget _buildContactsList() {
    final contacts = [
      {'name': 'Adnya', 'type': 'Personal'},
      {'name': 'Ajinkya', 'type': 'Business'},
      {'name': 'Akansha', 'type': 'Personal'},
      {'name': 'Akshita', 'type': 'Personal'},
      {'name': 'Aishwarya', 'type': 'Personal'},
      {'name': 'Alisha', 'type': 'Business'},
      {'name': 'Bhavika', 'type': 'Business'},
      {'name': 'Bhakti', 'type': 'Business'},
      {'name': 'Bharti', 'type': 'Personal'},
      {'name': 'Birla', 'type': 'Business'},
      // Add dummy contacts for letters C to Z
      ...List.generate(23, (i) {
        final letter = String.fromCharCode('C'.codeUnitAt(0) + i);
        return {
          'name': '$letter Dummy',
          'type': i % 2 == 0 ? 'Personal' : 'Business',
        };
      })
    ];

    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0 || contact['name']![0] != contacts[index - 1]['name']![0])
              Container(
                color: Colors.grey.shade300,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 290),
                    child: Text(
                      contact['name']![0],
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                    ),
                  ),
                ),
              ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: contact['type'] == 'Personal'
                    ? Colors.blue.shade100
                    : Colors.green.shade100,
                child: Icon(
                  contact['type'] == 'Personal' ? Icons.person : Icons.business,
                  color: contact['type'] == 'Personal' ? Colors.blue.shade800 : Colors.green.shade800,
                ),
              ),
              title: Text(contact['name']!),
              subtitle: Text(contact['type']!),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAlphabetStrip() {
    return Container(
      width: 40,
      color: Colors.grey.shade200,
      child: ListView.builder(
        itemCount: 26,
        itemBuilder: (context, index) {
          final letter = String.fromCharCode('A'.codeUnitAt(0) + index);
          return GestureDetector(
            onTap: () => _scrollToLetter(letter),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
              child: Text(
                letter,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }

  void _scrollToLetter(String letter) {
    final contacts = [
      {'name': 'Adnya', 'type': 'Personal'},
      {'name': 'Ajinkya', 'type': 'Business'},
      {'name': 'Akansha', 'type': 'Personal'},
      {'name': 'Akshita', 'type': 'Personal'},
      {'name': 'Aishwarya', 'type': 'Personal'},
      {'name': 'Alisha', 'type': 'Business'},
      {'name': 'Bhavika', 'type': 'Business'},
      {'name': 'Bhakti', 'type': 'Business'},
      {'name': 'Bharti', 'type': 'Personal'},
      {'name': 'Birla', 'type': 'Business'},
      // Add dummy contacts for letters C to Z
      ...List.generate(23, (i) {
        final letter = String.fromCharCode('C'.codeUnitAt(0) + i);
        return {
          'name': '$letter Dummy',
          'type': i % 2 == 0 ? 'Personal' : 'Business',
        };
      })
    ];

    final index = contacts.indexWhere((contact) => contact['name']![0] == letter);
    if (index != -1) {
      _scrollController.animateTo(
        index * 72.0, // Approximate height of a contact list item
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}