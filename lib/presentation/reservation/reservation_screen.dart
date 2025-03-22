import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/reservation/reservation_bloc.dart';
import 'package:reservation_system/bloc/reservation/reservation_event.dart';
import 'package:reservation_system/bloc/reservation/reservation_state.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/tab_button.dart';
import 'package:reservation_system/presentation/reservation/tab_screen/reservation_tab.dart';

class ReservationScreen extends StatefulWidget {
  final String? restaurantId;
  const ReservationScreen({super.key, this.restaurantId});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  Restaurant? restaurantData;
  int selectedTab = 1;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReservationBloc>(
      context,
    ).add(ReservationFetchRestaurantByID(id: widget.restaurantId!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6EFE8),
      body: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          final isLoading = state is ReservationLoading;
          if (state is ReservationFetchRestaurantSuccess) {
            restaurantData = state.restaurantData;
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  restaurantData == null || isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _buildHeader(context, restaurantData!),
                  TabButton(
                    tabItem: {1: "Reservation", 2: "Menu", 3: "Reviews"},
                    onTabSelected: (index) {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                  ),

                  if (selectedTab == 1)
                    ReservationTab(restaurantInfo: restaurantData),
                  if (selectedTab == 2) Text("Menu Screen"),
                  if (selectedTab == 3) Text("Reviews Screen"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildHeader(BuildContext context, Restaurant restaurant) {
  return SizedBox(
    width: double.infinity,
    height: 207,
    child: Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            restaurant.image ?? Assets.images.imgRestaurantBackground.path,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          left: 12,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 104,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.nameRestaurant.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  restaurant.address.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Now Open",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      " - Closes at 10:00PM",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
