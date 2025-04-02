import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_event.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/user.dart';
import 'package:reservation_system/models/validator_login/validator.dart';
import 'package:reservation_system/routes/route_named.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final User? user;
  const LoginScreen({super.key, this.user});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLogin = false;
  String? email;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString("userKey");

    if (userString != null) {
      final json = jsonDecode(userString);
      User user = User.fromJson(json);
      setState(() {
        phonenumberController.text = user.phoneNumber ?? "";
        passwordController.text = user.password ?? "";
        email = user.email;
      });
    }
  }

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLogin = true;
      });
      final phoneNumber = phonenumberController.text;
      final password = passwordController.text;
      final emailData = email;

      context.read<AuthenticationBloc>().add(
        LoginRequested(
          phoneNumber: phoneNumber,
          password: password,
          email: emailData,
        ),
      );
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6EFE8),
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticateFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Phone or Password is not correct!'),
                ),
              );
            } else if (state is AuththenticateSuccess && _isLogin) {
              setState(() {
                _isLogin = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('You login Success!')),
              );
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routenamed.homescreen,
                (route) => false,
              );
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              final isLoading = state is AuthLoading;
              return Center(
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
                                  Navigator.pushNamed(
                                    context,
                                    Routenamed.forgot,
                                  );
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
                            text: isLoading ? "LOADING..." : "LOG IN",
                            onPressed: isLoading ? null : () => _login(context),
                          ),

                          const SizedBox(height: 10),

                          TextButton(
                            onPressed: () async {
                              final result = await Navigator.pushNamed(
                                context,
                                Routenamed.signup,
                              );

                              if (result != null &&
                                  result is Map<String, dynamic>) {
                                setState(() {
                                  phonenumberController.text =
                                      result["phoneKey"] ?? "";
                                  passwordController.text =
                                      result["passKey"] ?? "";
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
              );
            },
          ),
        ),
      ),
    );
  }
}
