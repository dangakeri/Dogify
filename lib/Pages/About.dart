import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ExpansionTile(
                title: Text('Acknowledgement'),
                children: [
                  ListTile(
                    title: Text('Daniel Gakeri'),
                    subtitle: Text('Flutter Developer'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
