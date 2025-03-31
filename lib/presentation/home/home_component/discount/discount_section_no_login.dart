import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_bloc.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_event.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_state.dart';
import 'package:reservation_system/component/section/ui_section.dart';
import 'package:reservation_system/models/class/happy_deal.dart';
import 'package:reservation_system/presentation/home/home_component/discount_card.dart';

import '../../../../component/dialog/ui_dialog.dart';
import '../../../../routes/route_named.dart';

class DiscountSectionNoLogin extends StatelessWidget {
  const DiscountSectionNoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    List<HappyDeal> dealDatas = [];
    return BlocProvider(
      create: (context) => HappyDealBloc()..add(FetchHappyDealData()),
      child: BlocBuilder<HappyDealBloc, HappyDealState>(
        builder: (context, state) {
          if (state is HappyDealLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FetchHappyDealSuccess) {
            dealDatas = List.from(state.happydealList);
            return UISection(
              title: "Happy Deals",
              body: _buildBody(context, dealDatas),
              onPress: () {
                Navigator.pushNamed(context, Routenamed.happydeal);
              },
            );
          } else {
            return Center(child: Text("No deals available"));
          }
        },
      ),
    );
  }
}

Widget _buildBody(BuildContext context, List<HappyDeal> happyDeals) => SizedBox(
  height: 120,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.separated(
      itemCount: happyDeals.length,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder:
          (context, index) => DiscountCard(
            happyDeal: happyDeals[index],
            onPressed: () {
              UiDialog.show(
                context,
                title: "Information",
                content: Text("Please login to use our services"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routenamed.login);
                    },
                    child: Text("Login"),
                  ),
                ],
              );
            },
          ),
      separatorBuilder: (context, index) => SizedBox(width: 10),
    ),
  ),
);
