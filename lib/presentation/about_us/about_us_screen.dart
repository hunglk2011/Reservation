import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset(Assets.images.imgLogoBbq.path)),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Image.asset(
                      Assets.images.imageAbout.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 26,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "AN BBQ is a renowned Korean restaurant chain, celebrated as the King of Korean Grill. Our secret marination recipes are crafted by a top Korean chef with over 30 years of experience in Seoul. We use premium ingredients and cutting-edge grilling technology to ensure the flavors remain rich and authentic, while maintaining health benefits.\n\n"
                        "At AN BBQ, you can savor classic Korean delights such as Kimchi, Bibimbap, Bulgogi, and our signature AN BBQ grilled beef ribs. With a luxurious yet cozy ambiance, our restaurant is perfect for family gatherings, friendly meet-ups, or professional business meals. AN BBQ is committed to providing an unforgettable dining experience with exceptional service and authentic Korean flavors.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
