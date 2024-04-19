import 'package:ecommerce/screens/onboarding/getStarted_button.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/onboard.png"),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/carrot.png",
              height: 43.53,
              width: 38.21,
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 48,
                  color: Colors.white),
            ),
            const Text(
              "to our store",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 48,
                  color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Ger your groceries in as fast as one hour",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
            ),
            const GetStarted(),
            const SizedBox(height: 70)
          ],
        ),
      ),
    ));
  }
}
