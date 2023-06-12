import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travee/resources/color.dart';

import 'main_screen3.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
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
                image: AssetImage("assets/images/boy_girl_travel.jpg"),
              ),
            ),
          ),

          /// content on image
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            child: Column(
              children: [
                /// travel map
                Image.asset(
                  "assets/images/travel_map.png",
                  width: Get.width,
                  height: Get.width / 3,
                ),

                Expanded(child: Container()),

                /// title
                const Text(
                  "Find your travel mate",
                  //textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                FloatingActionButton(
                  onPressed: () {
                    Get.offAll(
                      const MainScreen3(),
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
