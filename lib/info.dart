import 'package:flutter/material.dart';

// AIT Teal Branding
const Color aitTeal = Color(0xFF28D2D1);

// AIT Font Styles 
const TextStyle kHeadlineStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: aitTeal,
);

const TextStyle kBodyStyle = TextStyle(
  fontSize: 16,
  color: Colors.black87,
);

const TextStyle kSubTextStyle = TextStyle(
  fontSize: 15,
  color: Colors.grey,
);

class EventInfoScreen extends StatefulWidget {
  const EventInfoScreen({super.key});

  @override
  State<EventInfoScreen> createState() => _EventInfoScreenState();
}

class _EventInfoScreenState extends State<EventInfoScreen> {
  final Map<int, bool> _showDetails = {};

  final List<Map<String, dynamic>> events = [
    {
      'image':
          'https://scontent.fsyd3-1.fna.fbcdn.net/v/t39.30808-6/487880670_1127714309395488_6369369097721240014_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=127cfc&_nc_ohc=a7ve8_YrUQIQ7kNvwEw0cyq&_nc_oc=AdloOBksZ2AUfcILDlwLbpCIQ_XZyDGc_j37KNCU4udo5zNUAUgKtTL9J4RHpGCFs-I&_nc_zt=23&_nc_ht=scontent.fsyd3-1.fna&_nc_gid=FzcX9T_FTEVeikwNW-1Tvg&oh=00_AfW27XJtDT-b71ylE5vV5xiAaooiOgIUWTCLzwoWsGCPbw&oe=689FCE4D',
      'title': 'AIT Orientation Day 2025',
      'dateLocation': 'August 15, 2025 • Sydney and Melbourne Campus',
      'description':
          'Get ready to kick off the new academic year with a dynamic day filled with innovation, creativity, and community spirit. Held at our Sydney Campus on August 15, this event offers students a chance to connect, explore cutting-edge tech, and gain insights from industry leaders. Whether youre into AI, coding, startups, or just looking to meet new people, Orientation Day sets the perfect tone for an exciting journey ahead.',
      'highlights': [
        'Inspiring Talks on AI & Machine Learning',
        'Hands-On Coding Hackathon',
        'Innovative Startup Pitch Competition',
        'Interactive Panels with Industry Experts',
      ],
      'speakers': [
        {
          'name': 'Dr. Anita Roberts – AI Researcher',
          'image': 'https://i.pravatar.cc/100?img=1',
        },
        {
          'name': 'John Tan – CTO, FutureTech',
          'image': 'https://i.pravatar.cc/100?img=2',
        },
      ],
    },
    {
      'image':
          'https://scontent.fsyd3-1.fna.fbcdn.net/v/t39.30808-6/487536467_1126980899468829_7303069205857407764_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=127cfc&_nc_ohc=HDIZ-NpthowQ7kNvwGK6Fnf&_nc_oc=Admcmu-iZA6KbTp4Ko7R4bqVdhvxPREwttKLXAFf8bqm56fOdEb7kHMg2bXv_4o_l_k&_nc_zt=23&_nc_ht=scontent.fsyd3-1.fna&_nc_gid=qU3qTJIM_n_w50zWAxjltQ&oh=00_AfUcQ3vo_WsgA3j9ATxwZtGiwa9SswFD6uWnyl3VEzP7kw&oe=689FA54F',
      'title': 'AIT Open Day 2025',
      'dateLocation': 'September 10, 2025 • Melbourne Campus',
      'description':
          'Experience the fusion of creativity and technology at AIT Open Day 2025. Join us at the Melbourne Campus for an inspiring day filled with student-led film screenings, cutting-edge VR and AR demos, and immersive digital art installations. Whether you’re passionate about media, design, or emerging tech, there’s something here to spark your imagination.',
      'highlights': [
        'Step Inside Virtual & Augmented Worlds',
        'Celebrate Talent at the Student Film Fest',
        'Explore Creative Tech Through Art Installations',
      ],
      'speakers': [
        {
          'name': 'Lena Zhang – VR Artist',
          'image': 'https://i.pravatar.cc/100?img=5',
        },
      ],
    },
    {
      'image':
          'https://scontent.fsyd3-1.fna.fbcdn.net/v/t39.30808-6/489878922_9789002991137627_1802502574144627506_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=127cfc&_nc_ohc=8mGc2RSEfQcQ7kNvwH23SKo&_nc_oc=AdmUdToNTwWKCsKPK81DnlP1OR7JbQOjZ_5MOkWJiFMD8dm-Wp8rEY8LIIhVb6MUlX0&_nc_zt=23&_nc_ht=scontent.fsyd3-1.fna&_nc_gid=7bKKtHYNIPgVPGYY5S0vHw&oh=00_AfVN0UG1rLmSo7cx-9lT3LaJsbwwyjNFyU3vI5zfD1MgXg&oe=689FA471',
      'title': 'Creative Workshop Series',
      'dateLocation': 'October 2, 2025 • Sydney Campus',
      'description':
          'Explore a series of hands-on creative workshops designed to ignite your imagination and build practical skills. Participate in interactive sessions covering game design, digital art, animation, and more. Connect with industry professionals and collaborate with peers to bring your ideas to life.',
      'highlights': [
        'Interactive Game Design Workshops',
        'Digital Art & Animation Sessions',
        'Collaborative Project Jams',
        'Portfolio & Career Guidance',
      ],
      'speakers': [
        {
          'name': 'Nina Park – Game Designer, PixelStorm',
          'image': 'https://i.pravatar.cc/100?img=11',
        },
        {
          'name': 'Devon Reed – Lead Dev, IndiePlay',
          'image': 'https://i.pravatar.cc/100?img=12',
        },
      ],
    },
    {
      'image':
          'https://scontent.fsyd3-2.fna.fbcdn.net/v/t39.30808-6/489993108_9789003244470935_4102913714575516554_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=127cfc&_nc_ohc=fchnjUjciRIQ7kNvwGCiJkn&_nc_oc=AdlycIuQN186m3MnTZ1EYAmfXYSbPdJ_cwUNMiyPaoscAyluscayjrNMdhoNOTdqJqU&_nc_zt=23&_nc_ht=scontent.fsyd3-2.fna&_nc_gid=AAHA3xdBysHIQDmNpRpR7Q&oh=00_AfX59WTbk8Sq1AFwC59Xz1bTRp57nQSvUeGesK1KksgWKQ&oe=689FB708',
      'title': 'Digital Marketing Summit',
      'dateLocation': 'October 25, 2025 • Sydney Campus',
      'description':
          'Stay ahead in digital strategy with talks on SEO, content, and analytics...',
      'highlights': [
        'SEO & SEM Deep Dive',
        'Social Media Masterclass',
        'Analytics in Action',
      ],
      'speakers': [
        {
          'name': 'Meera Singh – Growth Hacker',
          'image': 'https://i.pravatar.cc/100?img=15',
        },
        {
          'name': 'Tom Butler – Head of Marketing, BrightAds',
          'image': 'https://i.pravatar.cc/100?img=16',
        },
      ],
    },
    {
      'image':
          'https://scontent.fsyd3-1.fna.fbcdn.net/v/t39.30808-6/487674878_9728872757150651_456589274851333869_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=0b6b33&_nc_ohc=YWwk50x5E1AQ7kNvwElS9Y_&_nc_oc=AdnCuhTxYtvNomqS69M7g8d9tN6JesYI7bBpGYZbFkml_Lfy9SnXKZQ7VoQ420N3b2w&_nc_zt=23&_nc_ht=scontent.fsyd3-1.fna&_nc_gid=KSHn3aKDG0AG-2xddwGWsA&oh=00_AfXTWzvEbx441mg7pD2UdgdCULujGPP_SfVsZLabZNWcjQ&oe=689FB055',
      'title': 'Future of Design Conference',
      'dateLocation': 'November 12, 2025 • Melbourne Campus',
      'description':
          'Discover trends in UX/UI, branding, and creative design in tech spaces...',
      'highlights': [
        'Figma & Adobe XD Demos',
        'UX/UI Portfolio Reviews',
        'Brand Identity Workshops',
      ],
      'speakers': [
        {
          'name': 'Aisha Tran – UX Lead, CreativLab',
          'image': 'https://i.pravatar.cc/100?img=17',
        },
        {
          'name': 'Marcus Wells – Freelance Designer',
          'image': 'https://i.pravatar.cc/100?img=18',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Event Info',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: aitTeal,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: List.generate(events.length, (index) {
            final event = events[index];
            final isExpanded = _showDetails[index] ?? false;

            return Card(
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Event Image with toggle
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showDetails[index] = !isExpanded;
                        });
                      },
                      child: Stack(
                        children: [
                          Image.network(
                            event['image'],
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const SizedBox(
                                height: 220,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: 220,
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Icon(
                                      Icons.broken_image,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                          ),
                          Positioned(
                            right: 12,
                            top: 12,
                            child: CircleAvatar(
                              backgroundColor: Colors.white.withValues(
                                alpha: 0.8,
                              ),
                              child: Icon(
                                isExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Details Section
                  AnimatedCrossFade(
                    firstChild: Container(),
                    secondChild: _buildEventDetails(
                      title: event['title'],
                      dateLocation: event['dateLocation'],
                      description: event['description'],
                      highlights: List<String>.from(event['highlights']),
                      speakers: List<Map<String, String>>.from(
                        event['speakers'],
                      ),
                    ),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildEventDetails({
    required String title,
    required String dateLocation,
    required String description,
    required List<String> highlights,
    required List<Map<String, String>> speakers,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: kHeadlineStyle.copyWith(fontSize: 22)),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  dateLocation,
                  style: kSubTextStyle,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(description, style: kBodyStyle),
          const SizedBox(height: 20),

          // Highlights
          const Text(
            '✨ Highlights',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: highlights
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 18,
                          color: aitTeal,
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: Text(item, style: kBodyStyle)),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 24),

          // Guest Speakers
          const Text(
            '🎤 Guest Speakers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Column(
            children: speakers.map((speaker) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(speaker['image']!),
                      radius: 24,
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(speaker['name']!, style: kBodyStyle)),
                  ],
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Register Button
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.event_available),
              label: const Text('Register Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: aitTeal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
