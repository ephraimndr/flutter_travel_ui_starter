import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/hotel_model.dart';
import 'package:flutter_travel_ui_starter/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.bicycle,
  ];

  Widget _buildIcons(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Color.fromARGB(227, 178, 236, 243)
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 120,
            ),
            child: Text(
              "What would you like to find?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map((MapEntry map) => _buildIcons(map.key))
                .toList(),
          ),
          const SizedBox(height: 40.0),
          DestinationsCarousel(),
          const SizedBox(height: 40.0),
          HotelCarousel(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(hotels[2].imageUrl),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
