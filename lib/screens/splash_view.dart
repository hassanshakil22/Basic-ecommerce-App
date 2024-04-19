import 'dart:async';

import 'package:ecommerce/screens/onboarding/onboaring_View.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => OnboardingView())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff53B175),
        body: Center(
          child: Container(
              height: 68.61,
              width: 267.42,
              child: Image.asset("assets/images/logo.png")),
        ));
  }
}
