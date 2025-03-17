import 'package:flutter/material.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/presentation/onboard/onboard_convenient.dart';
import 'package:reservation_system/presentation/onboard/onboard_delicious.dart';
import 'package:reservation_system/presentation/onboard/onboard_position.dart';
import 'package:reservation_system/routes/route_named.dart';
import 'package:reservation_system/services/login_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late final PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Image.asset(Assets.images.imgLogoBbq.path, width: 211, height: 102),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) => {currentPage = value},
                children: [
                  OnboardPosition(),
                  OnboardConvenient(),
                  OnboardDelicious(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    LoginService.saveLoginToLocal();
                    Navigator.pushReplacementNamed(
                      context,
                      Routenamed.homescreen,
                    );
                  },
                  child: Text("Skip", style: TextStyle(fontSize: 16)),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: WormEffect(activeDotColor: Color(0xffAD3F32)),
                  onDotClicked: (index) {},
                ),
                IconButton(
                  onPressed: () {
                    if (currentPage == 2) {
                      Navigator.pushReplacementNamed(
                        context,
                        Routenamed.homescreen,
                      );
                    } else {
                      controller.nextPage(
                        duration: Duration(seconds: 2),
                        curve: Curves.easeOutSine,
                      );
                    }
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
