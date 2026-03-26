import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_app_description_page.dart';
import 'about_app_project_info_page.dart';
import 'about_app_tools_page.dart';
import 'about_app_acknowledgements_page.dart';
import 'about_app_developer_page.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  Future<void> _launchFeedbackURL() async {
    final Uri url = Uri.parse(
        'https://docs.google.com/forms/d/e/1FAIpQLSenujK5w_Pg8CiRcMRoaT1C99mYTSQ0cM0_62x2UhMVQzbX7Q/viewform?usp=publish-editor');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF2F6B3F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'About BaybayinGo!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            _buildAboutButton(context, 'App Description', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AboutAppDescriptionPage()),
              );
            }),
            const SizedBox(height: 16),
            _buildAboutButton(context, 'Project Info & Originality', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AboutAppProjectInfoPage()),
              );
            }),
            const SizedBox(height: 16),
            _buildAboutButton(context, 'Tools & Frameworks Used', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AboutAppToolsPage()),
              );
            }),
            const SizedBox(height: 16),
            _buildAboutButton(context, 'Acknowledgements', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AboutAppAcknowledgementsPage()),
              );
            }),
            const SizedBox(height: 16),
            _buildAboutButton(context, 'Developer', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AboutAppDeveloperPage()),
              );
            }),
            const SizedBox(height: 30),
            const Divider(color: Color(0xFFF7C85C), thickness: 1.5),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _launchFeedbackURL,
                icon: const Icon(Icons.feedback_rounded, color: Colors.white),
                label: const Text("Submit Feedback",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7FB77E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F6B3F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text("Back",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutButton(
      BuildContext context, String title, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFF6C0),
          foregroundColor: const Color(0xFF2F6B3F),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFF7C85C), width: 1.5),
          ),
          elevation: 2,
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                size: 20, color: Color(0xFF7FB77E)),
          ],
        ),
      ),
    );
  }
}
