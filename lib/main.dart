import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travee/screens/homescreen/bottom_nav_bar.dart';

void main() {
  String gptToken = "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";
  String gptApiKey = "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";
  // String orgId = "org-3EMmsvASfykyFOG55GAadAch";

  OpenAI.apiKey = gptApiKey;
  // OpenAI.organization = orgId;
  runApp(const MyApp()); // travee app
  //runApp(const DemoApp()); // animation class
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'travee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const BottomNavBar(),
    );
  }
}
