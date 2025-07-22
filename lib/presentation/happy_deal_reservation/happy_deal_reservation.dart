import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/presentation/happy_deal_reservation/widget/text_field.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/date_section.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/people_section.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/text_card.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/time_section.dart';
import 'package:reservation_system/routes/route_named.dart';
import '../../bloc/authentication/authentication_bloc.dart';
import '../../models/class/happy_deal.dart';
import '../../models/class/reservation.dart';
import '../happy_deal_detail/widget/header.dart';

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
  String? userId;

  @override
  void initState() {
    super.initState();
    final state = context.read<AuthenticationBloc>().state;
    if (state is AuththenticateSuccess) {
      userId = state.user.id;
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
               Header(title: widget.happyDeal!.name.toString(),),
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

                      UITextField(controller: noteController, hint: "Notes"),
                      UITextField(controller: fullNameText, hint:"Full Name"),
                      UITextField(controller: phoneNumberText, hint: "Phone Number"),
                      UITextField(controller:  emailText, hint: "Email"),

                      CustomButton(
                        text: "REVERSE",
                        onPressed: () {
                          final reservationData = Reservation(
                            userId: userId!,
                            createdDate: DateTime.now(),
                            restaurantId: widget.happyDeal!.restaurant!.id,
                            reservationDate: selectedDate,
                            reservationTime: selectedTime.toString(),
                            numberPeople: peopleCount,
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
}
