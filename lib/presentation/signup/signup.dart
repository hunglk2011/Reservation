// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reservation_system/component/UI_textinput/text_input.dart';
import 'package:reservation_system/component/ui_button/button.dart';
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

    final String? userString = AppPreference.prefs?.getString("signupKey");
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.imgLogoBbq.path,
                    width: 211,
                    height: 102,
                  ),
                  const SizedBox(height: 20),
                  TextInput(
                    hintText: "Full Name",
                    type: "text",
                    validator: Validator.validateName,
                    controller: fullnameController,
                  ),
                  const SizedBox(height: 12), // ✅ Thêm khoảng cách

                  TextInput(
                    hintText: "Phone Number",
                    type: "phone",
                    validator: Validator.validatePhoneNumber,
                    controller: phonenumberController,
                  ),
                  const SizedBox(height: 12), // ✅ Thêm khoảng cách

                  TextInput(
                    hintText: "Email",
                    type: "email",
                    validator: Validator.validateEmail,
                    controller: emailController,
                  ),
                  const SizedBox(height: 12), // ✅ Thêm khoảng cách

                  TextInput(
                    hintText: "Password",
                    type: "password",
                    obscureText: true,
                    controller: passwordController,
                    validator: Validator.validatePassword,
                  ),
                  const SizedBox(height: 12), // ✅ Thêm khoảng cách

                  TextInput(
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
                        final user = User(
                          name: fullnameController.text,
                          phoneNumber: phonenumberController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        );
                        final userJson = user.toJson();
                        final raw = jsonEncode(userJson);
                        await AppPreference.prefs?.setString("signupKey", raw);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('FORM is OK CAN LOGIN'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Future.delayed(const Duration(seconds: 3), () {
                          result = {
                            "phoneKey": phonenumberController.text,
                            "passKey": passwordController.text,
                            "nameKey": fullnameController.text,
                            "emailKey": emailController.text,
                          };

                          Navigator.pushReplacementNamed(
                            context,
                            Routenamed.login,
                            arguments: result,
                          );
                        });
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
    );
  }
}
