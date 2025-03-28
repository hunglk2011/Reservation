import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/models/class/user.dart';
import 'package:reservation_system/presentation/happy_deal/mock_data/happy_deal_data.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/date_section.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/people_section.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/text_card.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/time_section.dart';
import 'package:reservation_system/routes/route_named.dart';

import '../../models/class/happy_deal.dart';

class HappyDealReservationScreen extends StatefulWidget {
  const HappyDealReservationScreen({super.key});

  @override
  State<HappyDealReservationScreen> createState() =>
      _HappyDealReservationScreenState();
}

class _HappyDealReservationScreenState
    extends State<HappyDealReservationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameText = TextEditingController();
  final TextEditingController phoneNumberText = TextEditingController();
  final TextEditingController emailText = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  DateTime? selectedDate;
  int peopleCount = 1;
  TimeOfDay? selectedTime;

  final HappyDeal happyDeal = HappyDealData.mockHappyDeals.first;

  @override
  void initState() {
    super.initState();
    final state = context.read<AuthenticationBloc>().state;
    if (state is AuththenticateSuccess) {
      fullNameText.text =
          state.user.name ?? happyDeal.reservation!.userInfo!.name ?? "";
      phoneNumberText.text =
          state.user.phoneNumber ??
          happyDeal.reservation!.userInfo!.phoneNumber ??
          "";
      emailText.text =
          state.user.email ?? happyDeal.reservation!.userInfo!.email ?? "";
    }
    peopleCount = happyDeal.reservation!.peopleCount ?? 1;
    selectedDate = happyDeal.reservation!.reservationDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context),
              TextCard(
                text: "Must have vaccinated",
                itemIcon: Icon(Icons.local_hospital_sharp),
              ),
              TextCard(
                text: "Deposit for reservation",
                itemIcon: Icon(Icons.money),
              ),

              DateSection(
                title: "Pick your date",
                body: Container(),
                onDateChanged: (date) => setState(() => selectedDate = date),
              ),

              TimeSection(
                title: "Pick your time",
                onTimeChanged: (time) => setState(() => selectedTime = time),
              ),

              PeopleSection(
                title: "How many people?",
                onPeopleChanged: (count) => setState(() => peopleCount = count),
              ),

              _buildTextField(noteController, "Notes"),
              _buildTextField(fullNameText, "Full Name"),
              _buildTextField(phoneNumberText, "Phone Number"),
              _buildTextField(emailText, "Email"),

              CustomButton(
                text: "RESERVE",
                onPressed: () {
                  final reservationData = Reservation(
                    createdDate: DateTime.now(),
                    reservationDate: selectedDate,
                    restaurantInfo: happyDeal.reservation!.restaurantInfo,
                    peopleCount: peopleCount,
                    timeRange: selectedTime?.format(context) ?? "",
                    userInfo: User(
                      name: fullNameText.text,
                      phoneNumber: phoneNumberText.text,
                      email: emailText.text,
                    ),
                    notes: noteController.text,
                  );
                  Navigator.pushNamed(
                    context,
                    Routenamed.confirmReservation,
                    arguments: {"reservation": reservationData.toJson()},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: UITextInput(hintText: hint, type: "text", controller: controller),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF8960), Color(0xFFFF62A5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 28),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Laaarge Discounts",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
