import 'package:flutter/material.dart';

class AboutAppAcknowledgementsPage extends StatelessWidget {
  const AboutAppAcknowledgementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acknowledgements',
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
                children: [
                  const Text(
                    'The developer would like to express sincere gratitude to the following individuals from Baybayin Buhayin for their valuable contributions:',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  _buildPersonCard(
                    'John NL Leyson',
                    'Co-Founder of Baybayin Buhayin',
                    'Creator of the custom Baybayin font utilized in this application',
                  ),
                  const SizedBox(height: 16),
                  _buildPersonCard(
                    'Jose Jaime Enage',
                    'Founding Chairman of Baybayin Buhayin',
                    'Creator of the Baybayin Workshop presentation, which served as a key reference for the educational content of this app',
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Color(0xFFF7C85C), thickness: 1.5),
                  const SizedBox(height: 16),
                  const Text(
                    'All third-party materials are used strictly for educational purposes.',
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF2F6B3F)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonCard(String name, String title, String contribution) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person, color: Color(0xFF2F6B3F), size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F6B3F),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7FB77E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            contribution,
            style: const TextStyle(fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }
}
