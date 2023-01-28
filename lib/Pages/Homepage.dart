import 'package:dogify/Pages/About.dart';
import 'package:flutter/material.dart';

import '../Api Model/apiService.dart';
import 'Home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  List pages = [
    Home(),
    AboutPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Dogify',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          )),
        ),
        child: NavigationBar(
            selectedIndex: index,
            height: 80,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                  selectedIcon: Icon(Icons.home_filled)),
              NavigationDestination(
                  icon: Icon(Icons.code),
                  label: 'Dev',
                  selectedIcon: Icon(Icons.code)),
            ]),
      ),
    );
  }
}
