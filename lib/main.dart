import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasissta_project/model_class/provider_class.dart';
import 'package:wasissta_project/widget/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        AssistantContactListProvider();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
