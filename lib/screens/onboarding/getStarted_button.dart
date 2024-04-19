import 'package:ecommerce/screens/home_view.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      width: 353,
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        },
        backgroundColor: Color.fromARGB(200, 83, 177, 117),
        label: Container(
          child: Center(
            child: const Text(
              "Get started",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
    );
    ;
  }
}
