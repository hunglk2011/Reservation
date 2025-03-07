import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/component/dialog/ui_dialog.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';
import 'package:reservation_system/models/validator_login/validator.dart';
import 'package:reservation_system/routes/route_named.dart';
import 'package:reservation_system/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  final String? newPassword;
  final String? phoneNumber;
  final String? name;
  final String? email;
  const LoginScreen({
    super.key,
    this.newPassword,
    this.phoneNumber,
    this.name,
    this.email,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    // if (userString == null || userString.isEmpty) {
    //   phonenumberController.clear();
    //   passwordController.clear();
    //   return;
    // }

    // final json = jsonDecode(userString);
    // User user = User.fromJson(json);
    phonenumberController.text = widget.phoneNumber ?? "";
    passwordController.text = widget.newPassword ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6EFE8),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Image.asset(
                      Assets.images.imgLogoBbq.path,
                      width: 211,
                      height: 102,
                    ),
                    const SizedBox(height: 20),
                    UITextInput(
                      hintText: 'Phone Number',
                      type: 'number',
                      controller: phonenumberController,
                      validator: Validator.validatePhoneNumber,
                    ),
                    const SizedBox(height: 10),
                    UITextInput(
                      hintText: 'Password',
                      type: 'password',
                      obscureText: true,
                      controller: passwordController,
                      validator: Validator.validatePassword,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routenamed.forgot);
                          },
                          child: Text(
                            "Forgot Password?",
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
                    const SizedBox(height: 6),
                    CustomButton(
                      text: "LOG IN",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final userLogin = {
                            "phoneKey": phonenumberController.text,
                            "passKey": passwordController.text,
                            "nameKey": widget.name,
                            "emailKey": widget.email,
                          };

                          await AppPreference.prefs?.setString(
                            "userKey",
                            jsonEncode(userLogin),
                          );
                          LoginService.saveLoginToLocal();

                          CustomDialog.show(
                            context,
                            title: "LOG IN",
                            content: "SUCCESSFULLY",
                            navigation: () {
                              Navigator.pushNamed(
                                context,
                                Routenamed.homescreen,
                                arguments: userLogin,
                              );
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () async {
                        final result = await Navigator.pushNamed(
                          context,
                          Routenamed.signup,
                        );

                        if (result != null && result is Map<String, dynamic>) {
                          setState(() {
                            phonenumberController.text =
                                result["phoneKey"] ?? "";
                            passwordController.text = result["passKey"] ?? "";
                          });
                        }
                      },
                      child: Text(
                        "New here? Register",
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
