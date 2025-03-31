import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/models/class/user.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/date_section.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/people_section.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/text_card.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/time_section.dart';
import 'package:reservation_system/routes/route_named.dart';

class ReservationTab extends StatefulWidget {
  final Restaurant? restaurantInfo;
  const ReservationTab({super.key, this.restaurantInfo});

  @override
  State<ReservationTab> createState() => _ReservationTabState();
}

class _ReservationTabState extends State<ReservationTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameText = TextEditingController();

  final TextEditingController phoneNumberText = TextEditingController();

  final TextEditingController emailText = TextEditingController();

  final TextEditingController noteController = TextEditingController();
  DateTime? selectedDate;
  int? peopleCount = 0;
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
    return Column(
      children: [
        TextCard(
          text: "Must have vaccinated",
          itemIcon: Icon(Icons.local_hospital_sharp),
        ),
        TextCard(text: "Deposit for reservation", itemIcon: Icon(Icons.money)),

        DateSection(
          title: "Pick your date",
          body: Container(),
          onDateChanged: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),

        TimeSection(
          title: "Pick your time",
          onTimeChanged: (time) {
            setState(() {
              selectedTime = time;
            });
          },
        ),

        PeopleSection(
          title: "How many people?",
          onPeopleChanged: (count) {
            setState(() {
              peopleCount = count;
            });
          },
        ),

        Row(
          children: [
            Checkbox(value: false, onChanged: (bool? value) {}),
            Text(
              "Vaccine green passes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle("Notes"),
                _buildTextField(noteController),
                _buildSectionTitle("Information"),
                UITextInput(
                  hintText: "Full name",
                  type: "text",
                  controller: fullNameText,
                ),
                UITextInput(
                  hintText: "Phone Number",
                  type: "number",
                  controller: phoneNumberText,
                ),
                UITextInput(
                  hintText: "Email",
                  type: "email",
                  controller: emailText,
                ),
              ],
            ),
          ),
        ),
        CustomButton(
          text: "REVERSE",
          onPressed: () {
            final reservationData = Reservation(
              createdDate: DateTime.now(),
              reservationDate: selectedDate,
              restaurantInfo: widget.restaurantInfo,
              peopleCount: peopleCount,
              timeRange:
                  selectedTime != null
                      ? "${selectedTime!.hour}:${selectedTime!.minute}"
                      : "",
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
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8, top: 16),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xff483332),
      ),
    ),
  );
}

Widget _buildTextField(TextEditingController noteController) {
  return Container(
    width: 349,
    height: 69,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: TextFormField(
      decoration: InputDecoration(border: InputBorder.none),
      maxLines: 3,
      controller: noteController,
    ),
  );
}
