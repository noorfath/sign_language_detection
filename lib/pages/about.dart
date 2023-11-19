import 'package:flutter/material.dart';
import 'package:sign_language_detection/utils/colors.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kyellowcolor,
        title: Text('How to use'),
      ),
      body: Center(
        child: Text('This is the Documents Page'),
      ),
    );
  }
}
