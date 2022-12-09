import 'package:flutter/material.dart';

import 'contact.dart';
import 'messages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  maximumSize:
                      Size(MediaQuery.of(context).size.width / 1.8, 60),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width / 1.8, 60),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContactsScreen(),
                    ),
                  );
                },
                child: const Text("Contacts"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  maximumSize:
                      Size(MediaQuery.of(context).size.width / 1.8, 60),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width / 1.8, 60),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MessagesScreen(),
                    ),
                  );
                },
                child: const Text("Messages"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
