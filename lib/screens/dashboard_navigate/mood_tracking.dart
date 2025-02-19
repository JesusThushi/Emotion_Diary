import 'package:flutter/material.dart';

class MoodTrackingScreen extends StatelessWidget {
  // List of moods and emojis.
  final List<Map<String, String>> moods = [
    {"mood": "Happy", "emoji": "😊"},
    {"mood": "Good", "emoji": "🙂"},
    {"mood": "Normal", "emoji": "😐"},
    {"mood": "Sad", "emoji": "😢"},
    {"mood": "Upset", "emoji": "😡"},
    {"mood": "Stressed", "emoji": "😰"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Mood Tracking",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, // Prevents unnecessary expansion
                  children: [
                    const Text(
                      "How do you feel today?",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    _buildMoodGrid(constraints.maxWidth),
                    const SizedBox(height: 20),
                    _buildTextArea(),
                    const SizedBox(height: 20),
                    _buildSaveButton(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Mood Grid with responsive layout to prevent overflow
  Widget _buildMoodGrid(double screenWidth) {
    double itemSize = (screenWidth - 60) / 3; // Dynamic sizing based on screen width

    return GridView.builder(
      itemCount: moods.length, // Ensure moods list is used correctly here
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1, // Ensures square-like layout
      ),
      itemBuilder: (context, index) {
        return _buildMoodButton(
            moods[index]["mood"] ?? "Unknown", moods[index]["emoji"] ?? "❓", itemSize);
      },
    );
  }

  // Mood Button with dynamic sizing
  Widget _buildMoodButton(String mood, String emoji, double size) {
    return Column(
      children: [
        Container(
          width: size * 0.8,
          height: size * 0.8,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          mood,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Text Area for writing about the day
  Widget _buildTextArea() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        maxLines: 4,
        decoration: InputDecoration(
          hintText: "Write about your day...",
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Save Button to trigger saving the mood
  Widget _buildSaveButton() {
    return SizedBox(
      width: 140,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          // Save mood tracking data logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          "Save",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
