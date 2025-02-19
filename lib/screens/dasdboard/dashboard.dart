import 'package:flutter/material.dart';
import 'package:emotion_diary/screens/dashboard_navigate/mood_tracking.dart';
import 'package:emotion_diary/screens/dashboard_navigate/to_do_list.dart';
import 'package:emotion_diary/screens/dashboard_navigate/history.dart';
import 'package:emotion_diary/screens/dashboard_navigate/notification_screen.dart';
import 'package:emotion_diary/screens/profile/profile.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileHeader(context),
                SizedBox(height: 24),
                _buildDateTimeWidget(),
                SizedBox(height: 30),
                _buildDashboardCard(context, "Mood Tracking"),
                SizedBox(height: 20),
                _buildDashboardCard(context, "To-Do List"),
                SizedBox(height: 20),
                _buildDashboardCard(context, "History View"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Profile Header with Notification Bell
  Widget _buildProfileHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () {
          // Navigate to Profile Screen when clicking the profile icon
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpdatePersonalInfoScreen()), // Replace with your actual profile screen
          );
        },
        
        child: Row(
          children: [
            Icon(Icons.account_circle, size: 40, color: const Color.fromARGB(255, 171, 71, 188)), // Profile Icon
            SizedBox(width: 10),
            Text(
              "Hello Thushi Jeyaseelan!!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      IconButton(
        icon: Icon(Icons.notifications, size: 30, color: const Color.fromARGB(255, 171, 71, 188)), 
        onPressed: () {
          //print("Navigating to Notification Screen..."); // Debugging
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationScreen()),
          );
        },
      ),
    ],
  );
}


  // Date & Time Widget
  Widget _buildDateTimeWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Jun 10, 2024",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Text(
            "9:41 AM",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  // Dashboard Cards
  Widget _buildDashboardCard(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 22, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 3,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 14),
          SizedBox(
            width: 160,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (title == "Mood Tracking") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoodTrackingScreen()),
                  );
                } else if (title == "To-Do List") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ToDoListScreen()),
                  );
                } else if (title == "History View") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryPage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 171, 71, 188),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                "Click Here",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
