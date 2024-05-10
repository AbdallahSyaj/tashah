// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _HomePageState();
}

class _HomePageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: const GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                //leading: Text('home'),
              ),
              GButton(
                icon: Icons.settings,
                //leading: Text('setting'),
              ),
              GButton(
                icon: Icons.person,
                //leading: Text('search'),
              ),
              // GButton(icon:Icons.home),
            ]),
      ),
    );
  }
}
