import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactDetail extends StatelessWidget {
  const ContactDetail({Key? key, required this.contact}) : super(key: key);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black26,
          title: Text(contact.displayName),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  if (contact.phones.isNotEmpty) {
                    print(contact.phones);
                    print(contact.phones.first.number);
                    /*launchUrl(Uri.parse('tel: ${contact.phones}'));*/
                    launchUrlString('tel: ${contact.phones.first.number}');
                  } else {
                    print('empty number');
                  }
                },
                child: const Icon(
                  Icons.call,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 20
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    contact.photo == null
                        ? const Icon(
                            CupertinoIcons.person_crop_circle_fill,
                            color: Colors.black38,
                            size: 100,
                          )
                        : CircleAvatar(
                            radius: 45,
                            child: Image.memory(contact.photo!),
                          ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "First name:",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${contact.name.first}  ${contact.name.last}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Phone number:",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            contact.phones.isNotEmpty
                                ? contact.phones.first.number
                                : '(none)',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Email address:",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              contact.emails.isNotEmpty
                                  ? contact.emails.first.address
                                  : '(none)',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
        ));
  }
}
