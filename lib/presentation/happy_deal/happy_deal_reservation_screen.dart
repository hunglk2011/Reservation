import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/date_section.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/people_section.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/text_card.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/time_section.dart';
import 'package:reservation_system/routes/route_named.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../models/class/happy_deal.dart';
import '../../models/class/reservation.dart';
import '../../models/class/user.dart';

class HappyDealReservationScreen extends StatefulWidget {
  final HappyDeal? happyDeal;
  const HappyDealReservationScreen({super.key, this.happyDeal});

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

  @override
  void initState() {
    super.initState();
    final state = context.read<AuthenticationBloc>().state;
    if (state is AuththenticateSuccess) {
      fullNameText.text = state.user.name ?? "";
      phoneNumberText.text = state.user.phoneNumber ?? "";
      emailText.text = state.user.email ?? "user123@gmail.com";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildHeader(context, widget.happyDeal!.name.toString()),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
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
                        onDateChanged:
                            (date) => setState(() => selectedDate = date),
                      ),

                      TimeSection(
                        title: "Pick your time",
                        onTimeChanged:
                            (time) => setState(() => selectedTime = time),
                      ),

                      PeopleSection(
                        title: "How many people?",
                        onPeopleChanged:
                            (count) => setState(() => peopleCount = count),
                      ),

                      _buildTextField(noteController, "Notes"),
                      _buildTextField(fullNameText, "Full Name"),
                      _buildTextField(phoneNumberText, "Phone Number"),
                      _buildTextField(emailText, "Email"),

                      CustomButton(
                        text: "REVERSE",
                        onPressed: () {
                          final reservationData = Reservation(
                            createdDate: DateTime.now(),
                            reservationDate: selectedDate,
                            restaurantInfo: widget.happyDeal!.restaurant,
                            peopleCount: peopleCount,
                            timeRange:
                                selectedTime != null
                                    ? "${selectedTime!.hour}:${selectedTime!.minute}"
                                    : "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}",
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
                            arguments: {
                              "reservation": reservationData.toJson(),
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: UITextInput(
          hintText: hint,
          type: "text",
          controller: controller,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title) {
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
              title,
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
