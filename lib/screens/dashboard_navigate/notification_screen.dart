import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Map<String, bool> notifications = {
    "Morning Reminder": true,
    "Task Reminders": false,
    "Custom Reminder": true,
    "Night Reminder": true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Light purple background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Notification Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: notifications.keys.map((title) {
              return _buildNotificationTile(title, notifications[title]!);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationTile(String title, bool isEnabled) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  _getNotificationMessage(title),
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Switch(
            value: isEnabled,
            activeColor: Colors.purple,
            onChanged: (bool value) {
              setState(() {
                notifications[title] = value;
              });
            },
          ),
        ],
      ),
    );
  }

  String _getNotificationMessage(String title) {
    switch (title) {
      case "Morning Reminder":
        return "Good morning! 😊 How are you feeling today?";
      case "Task Reminders":
        return "Did you finish your tasks?";
      case "Custom Reminder":
        return "Customize your reminder";
      case "Night Reminder":
        return "🌙 Good night! A better day is coming. Rest well! ✨";
      default:
        return "";
    }
  }
}
