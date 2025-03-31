import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_bloc.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_event.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_state.dart';
import 'package:reservation_system/component/loading/ui_shimmer.dart';
import 'package:reservation_system/models/class/happy_deal.dart' show HappyDeal;
import 'package:reservation_system/presentation/happy_deal/component/happy_deal_card.dart';
import 'package:reservation_system/routes/route_named.dart';

class HappyDealScreen extends StatefulWidget {
  const HappyDealScreen({super.key});

  @override
  State<HappyDealScreen> createState() => _HappyDealScreenState();
}

class _HappyDealScreenState extends State<HappyDealScreen> {
  List<HappyDeal> deals = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HappyDealBloc()..add(FetchHappyDealData()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.keyboard_backspace, size: 30),
            ),
          ),
          body: BlocBuilder<HappyDealBloc, HappyDealState>(
            builder: (context, state) {
              if (state is HappyDealLoading) {
                return UiShimmer();
              }
              if (state is FetchHappyDealSuccess) {
                deals = List.from(state.happydealList);
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Happy Deals',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Expanded(
                        child: ListView.builder(
                          itemCount: deals.length,
                          itemBuilder: (context, index) {
                            return HappyDealCard(
                              gradient:
                                  index % 2 == 0
                                      ? const LinearGradient(
                                        colors: [
                                          Color(0xff1aab91),
                                          Color(0xff9af4e3),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                      : const LinearGradient(
                                        colors: [
                                          Color(0xffdd4227),
                                          Color(0xfff3ab9a),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                              isImageLeft: index % 2 == 0,
                              title: deals[index].name ?? "No Title",
                              subtitle: [
                                deals[index].description ??
                                    "No description available",
                              ],
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  Routenamed.happydealDetail,
                                  arguments: {"id": deals[index].id},
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: Text('Something went wrong.'));
            },
          ),
        ),
      ),
    );
  }
}
