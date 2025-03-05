import 'dart:convert';
import 'package:first_app/Models/login_service.dart';
import 'package:first_app/Widget/button.dart';
import 'package:first_app/Widget/text_input.dart';
import 'package:first_app/Widget/alert.dart';
import 'package:first_app/Widget/validator.dart';
import 'package:first_app/Routes/routeNamed.dart';
import 'package:first_app/Models/apearance.dart';
import 'package:first_app/Models/user.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final String? newPassword;
  const LoginScreen({super.key, this.newPassword});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _rememberMe = false;
  Map<String, dynamic>? dataSignup;

  @override
  void initState() {
    final String? userString = Apearance.prefs?.getString("signupKey");

    if (userString == null || userString.isEmpty) {
      phonenumberController.clear();
      passwordController.clear();
      return;
    }

    final json = jsonDecode(userString);
    User user = User.fromJson(json);
    phonenumberController.text = user.phoneNumber.toString();
    passwordController.text = user.password.toString();
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
                    const SizedBox(height: 10),
                    Image.asset('asset/Logo.png', width: 211, height: 102),
                    const SizedBox(height: 20),
                    TextInput(
                      hintText: 'Phone Number',
                      type: 'number',
                      controller: phonenumberController,
                      validator: Validator.validatePhoneNumber,
                    ),
                    const SizedBox(height: 10),
                    TextInput(
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
                            )),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ButtonSignup(
                      text: "LOG IN",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final userLogin = {
                            "phoneKey": phonenumberController.text,
                            "passKey": passwordController.text,
                            "nameKey": dataSignup?["nameKey"] ?? "",
                            "emailKey": dataSignup?["emailKey"] ?? "",
                          };

                          await Apearance.prefs
                              ?.setString("userKey", jsonEncode(userLogin));
                          LoginService.saveLoginToLocal();

                          CustomDialog.show(context,
                              title: "LOG IN",
                              content: "SUCCESSFULLY", navigation: () {
                            Navigator.pushNamed(context, Routenamed.homescreen,
                                arguments: userLogin);
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: () async {
                          final result = await Navigator.pushNamed(
                              context, Routenamed.signup);

                          if (result != null &&
                              result is Map<String, dynamic>) {
                            setState(() {
                              phonenumberController.text =
                                  result["phoneKey"] ?? "";
                              passwordController.text = result["passKey"] ?? "";
                              dataSignup = result;
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
                        ))
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
