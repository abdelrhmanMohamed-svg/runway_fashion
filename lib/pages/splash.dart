import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:runway_fashion/pages/home.dart';
import 'package:runway_fashion/widgets/animatedLine.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
        Duration(milliseconds: 1400),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(
            "assets/logo/logo.svg",
            width: 188,
          )),
          Gap(9),
          LineRevealAnimation(
              assetPath: "assets/logo/line.svg",
              width: 189.4,
              height: 16.47,
              duration: const Duration(milliseconds: 900)),
        ],
      ),
    );
  }
}
