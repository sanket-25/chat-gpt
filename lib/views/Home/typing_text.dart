import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


class TypingTexts extends StatefulWidget {
  @override
  _TypingTextsState createState() => _TypingTextsState();
}

class _TypingTextsState extends State<TypingTexts> {
  List<String> texts = [
    "This is the first text",
    "This is the second text",
    "And here's another one"
  ];

  int currentIndex = 0;
  String displayedText = "";
  Color backgroundColor = Colors.blue; // Initial background color

  @override
  void initState() {
    super.initState();
    startTypingLoop();
  }

  void startTypingLoop() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      startTyping();
    });
  }

  void startTyping() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (texts[currentIndex].length > displayedText.length) {
        setState(() {
          displayedText = texts[currentIndex]
              .substring(0, displayedText.length + 1);
        });
      } else {
        timer.cancel();
        // Wait for a moment and then start erasing
        Timer(Duration(seconds: 1), () {
          eraseText();
        });
      }
    });
  }

  void eraseText() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (displayedText.isNotEmpty) {
        setState(() {
          displayedText = displayedText.substring(0, displayedText.length - 1);
        });
      } else {
        timer.cancel();
        // Move to the next text in the list
        setState(() {
          currentIndex = (currentIndex + 1) % texts.length;
          // Change background color randomly
          backgroundColor = getRandomColor();
        });
      }
    });
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      color: backgroundColor,
      child: Center(
        child: Text(
          displayedText,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
