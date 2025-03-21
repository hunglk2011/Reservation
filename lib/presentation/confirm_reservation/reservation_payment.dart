import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/gen/assets.gen.dart';

class ReservationPayment extends StatelessWidget {
  const ReservationPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservation Payment"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
              builder: (
                BuildContext context,
                ScrollController scrollController,
              ) {
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Assets.images.imageGreenTick.path,
                          width: 85,
                          height: 85,
                        ),
                        Text(
                          "Your reservation is confirmed!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          "Your deposit for Reservation 716001 is 200.000VND. "
                          "Do you want to pay now?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 14),
                        CustomButton(text: "PAYMENT", onPressed: () {}),
                        SizedBox(height: 20),
                        Text(
                          "Note: If the customer cancels the reservation due to subjective reasons, the restaurant will not be responsible for refunding the deposit.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                            color: Colors.black,
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
