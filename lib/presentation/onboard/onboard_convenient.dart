import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class OnboardConvenient extends StatefulWidget {
  const OnboardConvenient({super.key});

  @override
  State<OnboardConvenient> createState() => _OnboardConvenientState();
}

class _OnboardConvenientState extends State<OnboardConvenient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                Assets.images.imgOrderCartoon.path,
                width: 300,
                height: 178,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "DELICIOUS",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff483232),
                      ),
                    ),
                    Text(
                      "Enjoy great food with your family",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff483232),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
