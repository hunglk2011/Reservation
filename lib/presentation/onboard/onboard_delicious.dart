import 'package:flutter/material.dart';

class OnboardDelicious extends StatefulWidget {
  const OnboardDelicious({super.key});

  @override
  State<OnboardDelicious> createState() => _OnboardDeliciousState();
}

class _OnboardDeliciousState extends State<OnboardDelicious> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "asset/Order.png",
              width: 260,
              height: 280,
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "CONVENIENT",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff483232)),
                    ),
                    Text(
                      "Online dish reservation",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff483232)),
                    ),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
