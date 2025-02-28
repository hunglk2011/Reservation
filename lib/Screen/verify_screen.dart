import 'package:first_app/Widget/button.dart';
import 'package:first_app/Widget/text_input.dart';
import 'package:first_app/Widget/validator.dart';
import 'package:first_app/Routes/routenamed.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFE8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Image.asset('asset/Logo.png', width: 211, height: 102),
                    const SizedBox(height: 16),
                    const Text(
                      "VERIFICATION",
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
                      "Enter the OTP code that we send you via SMS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Montserrat",
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextInput(
                      hintText: "Enter OTP Code",
                      type: "number",
                      validator: Validator.validateOTP,
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA93528),
                        ),
                        children: [
                          const TextSpan(text: "Don't receive code? "),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Resend",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ButtonSignup(
                      text: "VERIFY",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, Routenamed.reset);
                        }
                      },
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
