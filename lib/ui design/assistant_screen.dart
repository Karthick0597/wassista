import 'package:flutter/material.dart';
import 'package:wasissta_project/widget/string.dart';

class AssistantPage extends StatefulWidget {
  final bool isSelected;

  const AssistantPage({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isSelected == true
          ? AppBar(
              automaticallyImplyLeading: true,
              title: const Text(
                "Assistnat",
                style: TextStyle(
                    fontFamily: MyStrings.outfit,
                    color: Color(0xff767977),
                    fontSize: 20,
                    fontWeight: FontWeight.w200),
              ),
            )
          : null,
      body: const Center(child: Text("Assistnat")),
    );
  }
}
