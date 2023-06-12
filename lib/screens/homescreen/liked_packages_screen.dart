import 'package:flutter/material.dart';

class LikedPackagesScreen extends StatefulWidget {
  const LikedPackagesScreen({Key? key}) : super(key: key);

  @override
  State<LikedPackagesScreen> createState() => _LikedPackagesScreenState();
}

class _LikedPackagesScreenState extends State<LikedPackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("liked package screen"),
    );
  }
}
