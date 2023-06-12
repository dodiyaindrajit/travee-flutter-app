import 'package:flutter/material.dart';

class UserPackagesScreen extends StatefulWidget {
  const UserPackagesScreen({Key? key}) : super(key: key);

  @override
  State<UserPackagesScreen> createState() => _UserPackagesScreenState();
}

class _UserPackagesScreenState extends State<UserPackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("user package screen"),
    );
  }
}
