import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "History Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHistoryItem("Jun 10, 2024", "9:41 AM", "😊", "Mood: Happy", "Tasks History"),
              SizedBox(height: 15),
              _buildHistoryItem("Jun 9, 2024", "8:30 AM", "😐", "Mood: Neutral", "Tasks History"),
              SizedBox(height: 15),
              _buildHistoryItem("Jun 8, 2024", "7:15 AM", "😔", "Mood: Sad", "Tasks History"),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // History Item Widget
  Widget _buildHistoryItem(String date, String time, String emoji, String mood, String taskHistory) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                time,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMoodBox(emoji, mood),
              _buildTaskBox(taskHistory),
            ],
          ),
        ],
      ),
    );
  }

  // Mood Box Widget
  Widget _buildMoodBox(String emoji, String mood) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(emoji, style: TextStyle(fontSize: 24)),
          SizedBox(height: 5),
          Text(mood, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Task Box Widget
  Widget _buildTaskBox(String taskHistory) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        taskHistory,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
