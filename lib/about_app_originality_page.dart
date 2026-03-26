import 'package:flutter/material.dart';

class AboutAppOriginalityPage extends StatelessWidget {
  const AboutAppOriginalityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Originality Statement',
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
                    'This application, BaybayinGo!, including its codebase, user interface design, and digital assets, was developed originally for the ICS26011 Final Project. No templates or pre-built applications were used in its creation. All work reflects the independent effort of the developer.',
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
