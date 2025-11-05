import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'challenge.dart';
import 'agenda.dart';
import 'contact.dart';
import 'info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    const EventInfoScreen(),
    const Agenda(), 
    const Center(
      child: Text(
        'Home content here',
        style: TextStyle(fontSize: 18),
      ),
    ),
    const ChallengeScreen(),
    const ContactScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Remix.profile_line),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Remix.window_line),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Remix.home_2_line),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Remix.slideshow_line),
            label: 'Challenge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Remix.message_2_line),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}