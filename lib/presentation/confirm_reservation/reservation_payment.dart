import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/routes/route_named.dart';

class ReservationPayment extends StatelessWidget {
  const ReservationPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.images.imgRestaurantBackground.path,
                fit: BoxFit.cover,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.4,
              maxChildSize: 0.7,
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.images.imageGreenTick.path,
                          width: 85,
                          height: 85,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Your reservation is confirmed!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Your deposit for Reservation 716001 is 200.000 VND. \nDo you want to pay now?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          text: "PAYMENT",
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routenamed.homescreen,
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Note: If the customer cancels the reservation due to subjective reasons, the restaurant will not be responsible for refunding the deposit.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
