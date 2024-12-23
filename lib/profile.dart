import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF515CE1),
        elevation: 0,
        title: Text(
          "Profile Details",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade300,
          child: Column(
            children: [
              // Profile Header
              Stack(
                children: [
                  Container(
                    color: Color(0xFF515CE1),
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/profile_girl.png'), // Add your profile image path here
                        ),
                        SizedBox(height: 10),
                        Image(image: AssetImage('assets/logo_appbar.png'), height: 22,),
                        Text(
                          "Akshita",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Action Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionButton(icon: Icons.call, label: "Call"),
                    ActionButton(icon: Icons.message, label: "Message"),
                    ActionButton(icon: Icons.event_note, label: "Notes"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // Contact Info Section
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(title: "Contact Info"),
                    ContactInfoCard(
                      title: "+91 9825468566",
                      subtitle: "Mobile",
                    ),
                    ContactInfoCard(
                      title: "+91 9825468566",
                      subtitle: "Work",
                    ),
                    SizedBox(height: 5),
                    // Other Section
                    SectionHeader(title: "Other"),
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Icon(Icons.favorite_border, color: Colors.red),
                        title: Text("Add to Favorites"),
                      ),
                    ),
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Icon(Icons.delete, color: Colors.red),
                        title: Text("Delete Contact"),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Call History Section
                    SectionHeader(title: "Call History"),
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Icon(Icons.call, color: Colors.green),
                        title: Text("Outgoing call"),
                        subtitle: Text("Today 12:00 PM"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Icon(icon, color: Colors.grey.shade600, size: 28),
                SizedBox(height: 8),
                Text(
                  label,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

        ),

      ],
    );
  }
}

class ContactInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const ContactInfoCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.call, color: Colors.grey.shade700),
            SizedBox(width: 10),
            Icon(Icons.message, color: Colors.grey.shade600),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}
