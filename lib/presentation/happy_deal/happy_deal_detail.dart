import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_bloc.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_event.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_state.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/happy_deal.dart';
import 'package:reservation_system/routes/route_named.dart';

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
                        _Header(title: happyDeal!.name.toString()),
                        _DiscountInfo(),
                        _BeefImage(percent: happyDeal!.discountPercent),
                        SizedBox(height: 20),
                        _TermsAndConditions(
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

class _Header extends StatelessWidget {
  final String? title;
  const _Header({this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _DiscountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Free \n",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "2 drinks",
                  style: TextStyle(
                    color: Color(0xffAD3F32),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(Assets.images.imgCoca.path),
        ],
      ),
    );
  }
}

class _BeefImage extends StatelessWidget {
  final double? percent;
  const _BeefImage({this.percent});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "UP TO \n",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "${percent.toString()}% \n",
                  style: TextStyle(
                    color: Color(0xffAD3F32),
                    fontSize: 55,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "OFF \n \n \n",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "NO UPPER LIMIT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Image.asset(Assets.images.imgBeef.path, fit: BoxFit.cover),
        ),
      ],
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  final double? percent;
  final DateTime? expired;
  final VoidCallback? onPressed;
  const _TermsAndConditions({this.expired, this.percent, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Terms & Condition",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${percent.toString()} off ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffAD3F32),
                      ),
                    ),
                    TextSpan(
                      text: "for family reservation \n \n \n",
                      style: TextStyle(fontSize: 14, color: Color(0xffAD3F32)),
                    ),
                    TextSpan(
                      text: "Time slots from 10:00 to 15:00",
                      style: TextStyle(fontSize: 14, color: Color(0xffAD3F32)),
                    ),
                  ],
                ),
              ),
              Image.asset(Assets.images.imgFamilyCartoon.path),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Assets.images.imgMan.path),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Applicable to all branches \n \n \n",
                      style: TextStyle(fontSize: 14, color: Color(0xffAD3F32)),
                    ),
                    TextSpan(
                      text:
                          "Valid until ${expired?.day.toString()}/${expired?.month.toString()}/${expired?.year.toString()}",
                      style: TextStyle(fontSize: 14, color: Color(0xffAD3F32)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomButton(text: "GET IT NOW", onPressed: onPressed),
        ],
      ),
    );
  }
}
