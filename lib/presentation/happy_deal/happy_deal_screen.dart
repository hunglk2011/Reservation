import 'package:flutter/material.dart';
import 'package:reservation_system/presentation/happy_deal/component/happy_deal_card.dart';
import 'package:reservation_system/routes/route_named.dart';

class HappyDealScreen extends StatefulWidget {
  const HappyDealScreen({super.key});

  @override
  State<HappyDealScreen> createState() => _HappyDealScreenState();
}

class _HappyDealScreenState extends State<HappyDealScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.keyboard_backspace, size: 30),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Happy Deals',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return HappyDealCard(
                      gradient:
                          index % 2 == 0
                              ? const LinearGradient(
                                colors: [Color(0xff1aab91), Color(0xff9af4e3)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                              : const LinearGradient(
                                colors: [Color(0xffdd4227), Color(0xfff3ab9a)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                      imageAlignment:
                          index % 2 == 0
                              ? Alignment.centerLeft
                              : Alignment.bottomRight,
                      title:
                          index % 2 == 0 ? 'TRY NEW DISHES' : 'LARGE DISCOUNTS',
                      subtitle:
                          index % 2 == 0
                              ? ['Explore unique tastes', 'For new eateries']
                              : ['Upto 20% OFF', 'No Upper Limit!'],
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routenamed.happydealReservation,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
