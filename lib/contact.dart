import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const TextStyle kHeadlineStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w600,
  letterSpacing: 0,
  height: 1.2,
  color: Colors.black87,
);

const TextStyle kSubheadlineStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  letterSpacing: 0,
  height: 1.3,
  color: Colors.black87,
);

const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  letterSpacing: 0.5,
  height: 1.3,
  color: Colors.black54,
);

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
  height: 1.2,
  color: Colors.black87,
);

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String imageUrl,
    required Color borderColor,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 230,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor.withValues(alpha: 0.5),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: borderColor.withValues(alpha: 0.2),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(imageUrl, height: 110, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: kSubheadlineStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: borderColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: kBodyTextStyle.copyWith(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactBlock(
    String city,
    String address,
    String phone,
    String email,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              city,
              style: kSubheadlineStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              address,
              style: kBodyTextStyle.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.phone, size: 20, color: Colors.blue.shade700),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _launchURL('tel:$phone'),
                  child: Text(
                    phone,
                    style: kBodyTextStyle.copyWith(color: Colors.blue.shade700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.email, size: 20, color: Colors.blue.shade700),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _launchURL('mailto:$email'),
                  child: Text(
                    email,
                    style: kBodyTextStyle.copyWith(color: Colors.blue.shade700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialRow() {
    final socialIcons = [
      'https://cdn-icons-png.flaticon.com/512/174/174857.png', // LinkedIn
      'https://cdn-icons-png.flaticon.com/512/5968/5968764.png', // Instagram
      'https://cdn-icons-png.flaticon.com/512/281/281764.png',
      'https://cdn-icons-png.flaticon.com/512/5968/5968958.png',
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialIcons.map((iconUrl) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Image.network(
            iconUrl,
            width: 32,
            height: 32,
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Contact Us"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
          children: [
            Text(
              "How can we help?",
              style: kHeadlineStyle.copyWith(color: Colors.black87),
            ),
            const SizedBox(height: 28),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  _buildCard(
                    title: "Talk to a\nCourse Advisor",
                    subtitle: "Advice on choosing the right career path.",
                    imageUrl:
                        "https://scontent.fsyd3-2.fna.fbcdn.net/v/t39.30808-6/494194961_9957368900967701_756858595202900439_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=127cfc&_nc_ohc=PD0NKDl7xFkQ7kNvwEsZcpM&_nc_oc=Adn8bHxgJ6Qb36g-1VdYrMIKbUSgnH5YTeoIV6tO7ULJxLAcDXvX52skaENm2PMHHNQ&_nc_zt=23&_nc_ht=scontent.fsyd3-2.fna&_nc_gid=5lQm5y95ihB45MbYYOQo4w&oh=00_AfVE8qKeWATVsw0Y5OM4m6-9__a7uMG01yjVZykPN8tQ0A&oe=689FACFB",
                    borderColor: Colors.orange.shade700,
                  ),
                  _buildCard(
                    title: "Book a\nCampus Tour",
                    subtitle: "Take a peek behind the curtain.",
                    imageUrl:
                        "https://scontent.fsyd3-1.fna.fbcdn.net/v/t39.30808-6/495391765_9957368590967732_5990798812950658096_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=127cfc&_nc_ohc=Myx8pp8_rtQQ7kNvwEcmFlQ&_nc_oc=Adk8DAFL9B64ZGn-DURM3I8iE3Jldebo0tqNQPOzrwmnOdVhxngWwrrwasQ8QjBf6VQ&_nc_zt=23&_nc_ht=scontent.fsyd3-1.fna&_nc_gid=LItXuo-vAmhEY0JThV5MQw&oh=00_AfUyMhicl9tH-uANpriB7y7B1VIEe4P-Rj7iis5v9KAfoQ&oe=689FB94C",
                    borderColor: Colors.purple.shade700,
                  ),
                  _buildCard(
                    title: "Download a\nCourse Guide",
                    subtitle: "Get info in your inbox.",
                    imageUrl:
                        "https://scontent.fsyd3-2.fna.fbcdn.net/v/t39.30808-6/301114692_5614981155206519_424625735997859441_n.png?_nc_cat=110&ccb=1-7&_nc_sid=0b6b33&_nc_ohc=ylGpOVhN2D8Q7kNvwFlUVDa&_nc_oc=AdnaL5W4JR1I-aDLSSVNPJj9Ce0xhziWgPs2WjPJlPQYk5NVRVY9enDyjt7YcigYmBM&_nc_zt=23&_nc_ht=scontent.fsyd3-2.fna&_nc_gid=0xBituPjHhZRqpDJ8lG-jw&oh=00_AfW8iYnXq3oO2lNFm4l6U2UcfdEhuv_HzeOcyKMa8zentw&oe=689FAEB0",
                    borderColor: Colors.red.shade700,
                  ),
                  _buildCard(
                    title: "Ask us\nAnything",
                    subtitle: "We’ll do our best to help.",
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQn3mSnhz2xgi1K7rgxGmr7XPolA6UGlai8g&s",
                    borderColor: Colors.green.shade700,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContactBlock(
                    "Sydney Campus",
                    "Level 2, 7 Kelly St\nUltimo NSW 2007",
                    "+61 2 7226 3773",
                    "info@ait.edu.au",
                  ),
                  const SizedBox(width: 20),
                  _buildContactBlock(
                    "Melbourne Campus",
                    "Level 13, 120 Spencer St\nMelbourne VIC 3000",
                    "+61 2 7226 3773",
                    "info@ait.edu.au",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Center(child: Text("FOLLOW US", style: kButtonTextStyle)),
            const SizedBox(height: 14),
            _buildSocialRow(),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
