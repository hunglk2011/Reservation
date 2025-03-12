import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/date_section.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/people_section.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/text_card.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/time_section.dart';

class ReservationTab extends StatelessWidget {
  ReservationTab({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameText = TextEditingController();
  final TextEditingController phoneNumberText = TextEditingController();
  final TextEditingController emailText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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

          DateSection(title: "Pick your date", body: Container()),

          TimeSection(title: "Pick your time"),

          PeopleSection(title: "How many people?"),

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle("Notes"),
                _buildTextField(),
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
          CustomButton(text: "REVERSE", onPressed: () {}),
        ],
      ),
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

Widget _buildTextField() {
  return Container(
    width: 349,
    height: 69,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.symmetric(horizontal: 16), // Giúp chữ không bị sát mép
    child: TextFormField(decoration: InputDecoration(border: InputBorder.none)),
  );
}
