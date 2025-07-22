import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_bloc.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_event.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_state.dart';
import 'package:reservation_system/models/class/happy_deal.dart';
import 'package:reservation_system/presentation/happy_deal_detail/widget/menu_image.dart';
import 'package:reservation_system/presentation/happy_deal_detail/widget/term_condition.dart';
import 'package:reservation_system/routes/route_named.dart';

import '../happy_deal_detail/widget/discount_info.dart';
import '../happy_deal_detail/widget/header.dart';

class HappyDealDetail extends StatefulWidget {
  final String? id;
  const HappyDealDetail({super.key, this.id});

  @override
  State<HappyDealDetail> createState() => _HappyDealDetailState();
}

class _HappyDealDetailState extends State<HappyDealDetail> {
  HappyDeal? happyDeal;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              HappyDealBloc()
                ..add(FetchHappyDealDetail(happydealId: widget.id)),
      child: Scaffold(
        body: BlocBuilder<HappyDealBloc, HappyDealState>(
          builder: (context, state) {
            if (state is HappyDealLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is FetchHappyDealDetailSuccess) {
              happyDeal = state.happyDeal;
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF8C7E), Color(0xFFF7B799)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                       Header(title: happyDeal!.name.toString()),
                       DiscountInfo(),
                        MenuImage(percent: happyDeal!.discountPercent),
                        SizedBox(height: 20),
                       TermsAndConditions(
                          expired: happyDeal?.expiryDate,
                          percent: happyDeal?.discountPercent,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routenamed.happydealReservation,
                              arguments: {"happyDeal": happyDeal?.toJson()},
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Center(child: Text("Something went wrong!"));
          },
        ),
      ),
    );
  }
}

