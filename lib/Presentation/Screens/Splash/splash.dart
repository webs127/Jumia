import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jumia/Presentation/Resources/constants.dart';
import 'package:jumia/Presentation/Resources/route_manager.dart';

import '../../Resources/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  startDelay() {
    _timer = Timer(const Duration(seconds: 4), nextPage);
  }

  nextPage() {
    Navigator.pushReplacementNamed(context, RouteManager.wrapper);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: ColorManager.splash,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 95,
              height: 95,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.star)
                )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 86,
              height: 32,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.title)
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
