import 'package:contact_message/contacts_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (await FlutterContacts.requestPermission()) {
      _contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(_contacts);
      setState(() {});
    }else{
      setState(() {
        _permissionDenied=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black26,
        title: const Text("Contacts"),
      ),
      body: _permissionDenied
          ? const Center(child: Text("Permission is not granted"))
          : _contacts == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _contacts!.length,
                  itemBuilder: (context, i) => ListTile(
                      title: Text(_contacts![i].displayName),
                      onTap: () async {
                        final fullContact =
                            await FlutterContacts.getContact(_contacts![i].id);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ContactDetail(contact: fullContact!),
                          ),
                        );
                      })),
    );
  }
}
