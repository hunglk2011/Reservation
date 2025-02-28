import 'package:first_app/Widget/alert.dart';
import 'package:first_app/Widget/button.dart';
import 'package:first_app/Widget/text_input.dart';
import 'package:first_app/Widget/validator.dart';
import 'package:first_app/Routes/routenamed.dart';
import 'package:flutter/material.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                      "ENTER YOUR NEW PASSWORD",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        letterSpacing: 2,
                        color: Color(0xff483232),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextInput(
                      hintText: "New Password",
                      type: "password",
                      obscureText: true,
                      controller: passwordController,
                      validator: Validator.validatePassword,
                    ),
                    const SizedBox(height: 10),
                    TextInput(
                      hintText: "Confirm Password",
                      type: "password",
                      obscureText: true,
                      controller: confirmPasswordController,
                      validator: (value) => Validator.validateConfirmPassword(
                        value,
                        passwordController.text,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ButtonSignup(
                      text: "SAVE",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ModalBottomSheet.showSheet(context, () {
                            Navigator.pushReplacementNamed(
                                context, Routenamed.login);
                          });
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
