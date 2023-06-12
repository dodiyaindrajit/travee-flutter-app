import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travee/resources/color.dart';

import '../homescreen/home_screen.dart';

class MainScreen3 extends StatefulWidget {
  const MainScreen3({super.key});

  @override
  State<MainScreen3> createState() => _MainScreen3State();
}

class _MainScreen3State extends State<MainScreen3> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///background image
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/boat.jpg"),
              ),
            ),
          ),

          /// content on image
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            child: Column(
              children: [
                Expanded(child: Container()),

                /// title
                const Text(
                  "Plan your trip",
                  //textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 50),

                FloatingActionButton(
                  onPressed: () {
                    Get.offAll(
                      const HomeScreen(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  backgroundColor: kPrimaryColor,
                  elevation: 8,
                  child: const Icon(Icons.navigate_next),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
