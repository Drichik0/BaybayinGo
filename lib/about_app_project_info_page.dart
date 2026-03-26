import 'package:flutter/material.dart';

class AboutAppProjectInfoPage extends StatelessWidget {
  const AboutAppProjectInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Information',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF6C0),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF7C85C), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2F6B3F).withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'This application was developed as a course requirement for ICS26011. The project was created independently by a Computer Science undergraduate student as part of their academic coursework.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
