import 'package:flutter/material.dart';

class AboutAppToolsPage extends StatelessWidget {
  const AboutAppToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tools & Frameworks',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Development Tools',
              items: [
                TextSpan(children: [
                  const TextSpan(
                      text: 'Visual Studio Code',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: ' — Primary code editor used for development'),
                ]),
                TextSpan(children: [
                  const TextSpan(
                      text: 'Flutter SDK',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text: ' — Main framework for building the user interface, navigation, and layout'),
                ]),
                TextSpan(children: [
                  const TextSpan(
                      text: 'Dart',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: ' — Programming language used to develop the application'),
                ]),
              ],
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: 'Frameworks & Assets',
              items: [
                TextSpan(children: [
                  const TextSpan(
                      text: 'BaybayinSimpleTAWBID.ttf',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: ' — Custom Baybayin font integrated via pubspec.yaml'),
                ]),
                TextSpan(children: [
                  const TextSpan(
                      text: 'Material Design Widgets',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text: ' — UI components such as Scaffold, AppBar, and ElevatedButton used to construct the interface'),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<InlineSpan> items}) {
    return Container(
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
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF7FB77E).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.build_circle_rounded,
                    color: Color(0xFF2F6B3F), size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F6B3F),
                ),
              ),
            ],
          ),
          const Divider(color: Color(0xFFF7C85C), thickness: 1.5),
          const SizedBox(height: 10),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.circle, size: 7, color: Color(0xFF7FB77E)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 15, height: 1.4, color: Colors.black),
                        children: [item],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
