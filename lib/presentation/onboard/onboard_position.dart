import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class OnboardPosition extends StatefulWidget {
  const OnboardPosition({super.key});

  @override
  State<OnboardPosition> createState() => _OnboardPositionState();
}

class _OnboardPositionState extends State<OnboardPosition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Assets.images.imgMap.path, width: 300, height: 178),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "NEARBY RESTAURANT",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff483232),
                      ),
                    ),
                    Text(
                      "Don't have to go far to find a good restaurant",
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
