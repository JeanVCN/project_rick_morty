import 'package:flutter/material.dart';
import 'package:project_rick_morty/layout_character.dart';
import 'package:project_rick_morty/layout_location.dart';
import 'package:project_rick_morty/layout_episode.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MainNavigate(),
  ));
}

class MainNavigate extends StatefulWidget {
  const MainNavigate({Key? key}) : super(key: key);

  @override
  _MainNavigateState createState() => _MainNavigateState();
}

class _MainNavigateState extends State<MainNavigate> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    LayoutCharacter(),
    LayoutLocation(),
    LayoutEpisode(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick And Morty Catalogue')),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 53, 52, 52),
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: "Personagens",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_city,
              ),
              label: "Locais"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie_filter_rounded,
            ),
            label: "Episódios",
          ),
        ],
      ),
    );
  }
}
