import 'package:flutter/material.dart';
import 'package:emotion_diary/screens/welcome_screen/welcome_screen.dart';


void main() {
  runApp(EmotionDiaryApp());
}

class EmotionDiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

