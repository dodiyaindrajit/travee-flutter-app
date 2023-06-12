import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travee/resources/color.dart';

import 'main_screen2.dart';

class MainScreen1 extends StatefulWidget {
  const MainScreen1({super.key});

  @override
  State<MainScreen1> createState() => _MainScreen1State();
}

class _MainScreen1State extends State<MainScreen1> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          ///background image
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/road.jpg"),
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
                  "Explore the world",
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),

                ActionSlider.standard(
                  width: Get.width / 2,
                  toggleColor: kPrimaryColor,
                  icon: const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 25,
                  ),
                  loadingIcon: const CircularProgressIndicator(color: Colors.white, strokeWidth: 1),
                  successIcon: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 25,
                  ),
                  backgroundColor: Colors.black.withOpacity(.4),
                  action: (controller) async {
                    controller.loading(); //starts loading animation
                    await Future.delayed(const Duration(seconds: 1));
                    controller.success(); //starts success animation
                    await Future.delayed(const Duration(seconds: 1));

                    Get.offAll(
                      const MainScreen2(),
                      transition: Transition.zoom,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Explore',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
