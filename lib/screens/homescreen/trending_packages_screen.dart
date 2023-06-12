import 'package:flutter/material.dart';

class TrendingPackagesScreen extends StatefulWidget {
  const TrendingPackagesScreen({Key? key}) : super(key: key);

  @override
  State<TrendingPackagesScreen> createState() => _TrendingPackagesScreenState();
}

class _TrendingPackagesScreenState extends State<TrendingPackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("trending package screen"),
    );
  }
}
