// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/bloC/authentication_bloc/authentication_bloc.dart';
import 'package:reservation_system/bloc/event/authentication_event/authentication_event.dart';
import 'package:reservation_system/bloc/state/authentication_state/authentication_state.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/user.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';
import 'package:reservation_system/models/validator_login/validator.dart';
import 'package:reservation_system/routes/route_named.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Map<String, dynamic>? result;

  @override
  void initState() {
    super.initState();

    final String? userString = AppPreference.prefs?.getString("userKey");
    if (userString == null || userString.isEmpty) return;

    try {
      final Map<String, dynamic> json = jsonDecode(userString);
      User user = User.fromJson(json);

      fullnameController.text = user.name ?? "";
      phonenumberController.text = user.phoneNumber ?? "";
      emailController.text = user.email ?? "";
      passwordController.text = user.password ?? "";
      confirmPasswordController.text = user.confirmPassword ?? "";
    } catch (e) {
      debugPrint("Error parsing user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFE8),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuththenticateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('FORM is OK CAN LOGIN'),
                backgroundColor: Colors.green,
              ),
            );
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushReplacementNamed(context, Routenamed.login);
            });
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.imgLogoBbq.path,
                      width: 211,
                      height: 102,
                    ),
                    const SizedBox(height: 20),
                    UITextInput(
                      hintText: "Full Name",
                      type: "text",
                      validator: Validator.validateName,
                      controller: fullnameController,
                    ),
                    const SizedBox(height: 12),

                    UITextInput(
                      hintText: "Phone Number",
                      type: "phone",
                      validator: Validator.validatePhoneNumber,
                      controller: phonenumberController,
                    ),
                    const SizedBox(height: 12),

                    UITextInput(
                      hintText: "Email",
                      type: "email",
                      validator: Validator.validateEmail,
                      controller: emailController,
                    ),
                    const SizedBox(height: 12),

                    UITextInput(
                      hintText: "Password",
                      type: "password",
                      obscureText: true,
                      controller: passwordController,
                      validator: Validator.validatePassword,
                    ),
                    const SizedBox(height: 12),

                    UITextInput(
                      hintText: "Confirm Password",
                      type: "password",
                      obscureText: true,
                      controller: confirmPasswordController,
                      validator:
                          (value) => Validator.validateConfirmPassword(
                            value,
                            passwordController.text,
                          ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: "SIGN UP",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final User user = User(
                            name: fullnameController.text,
                            phoneNumber: phonenumberController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                          context.read<AuthenticationBloc>().add(
                            SignupRequested(user: user),
                          );
                        }
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Already have an account? Log in",
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
