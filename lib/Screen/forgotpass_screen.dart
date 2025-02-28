import 'package:first_app/Widget/button.dart';
import 'package:first_app/Widget/text_input.dart';
import 'package:first_app/Widget/validator.dart';
import 'package:first_app/Routes/routenamed.dart';
import 'package:flutter/material.dart';

class ForgotpassScreen extends StatefulWidget {
  const ForgotpassScreen({super.key});

  @override
  State<ForgotpassScreen> createState() => _ForgotpassScreenState();
}

class _ForgotpassScreenState extends State<ForgotpassScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFE8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('asset/Logo.png', width: 211, height: 102),
                    const SizedBox(height: 14),
                    const Text(
                      "Forgot Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        letterSpacing: 2,
                        color: Color(0xff483232),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "We will send you an OTP on your phone number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Montserrat",
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextInput(
                      hintText: "Enter Phone Number",
                      type: "number",
                      validator: Validator.validatePhoneNumber,
                    ),
                    const SizedBox(height: 14),
                    ButtonSignup(
                      text: "GET OTP",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, Routenamed.verify);
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Return to Login",
                        style: TextStyle(
                          color: Color(0xFFA93528),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFA93528),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
