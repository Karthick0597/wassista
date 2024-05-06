import 'package:flutter/material.dart';
import 'contactlist_screen.dart';

class ContactPage extends StatefulWidget {
  final bool isSelected;
  const ContactPage({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: ContactListScreen(
              isSelected: true,
              onAssistantSelected: (String assistantName) {},
            ),
          ),
        ],
      )),
    );
  }
}
