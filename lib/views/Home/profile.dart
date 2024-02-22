import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final bool darkTheme;

  Profile({
    required this.darkTheme,
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState(darkTheme);
}

class _ProfileState extends State<Profile> {
  bool darkTheme;

  _ProfileState(this.darkTheme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
            color: darkTheme ? Colors.white : Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                    ),
                    radius: 40,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "JATIN TALREJA",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: darkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Web Developer",
                      style: TextStyle(
                        fontSize: 14,
                        color: darkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildProfileRow(Icons.mail, "Email", "2021.jatin.talreja@ves.ac.in"),
            _buildProfileRow(Icons.phone, "Subscription", "Free plan"),
            _buildProfileRow(Icons.location_on, "Data Controls", "Data Added"),
            _buildProfileRow(Icons.architecture, "Archived Chats", "Archived Chats List"),
            _buildProfileRow(Icons.integration_instructions, "Custom Instructions", "Instructions"),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow(IconData icon, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(), // Divider line
        SizedBox(height: 12),
        Row(
          children: [
            Icon(icon, color: Colors.grey),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: darkTheme ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12),
      ],
    );
  }
}

