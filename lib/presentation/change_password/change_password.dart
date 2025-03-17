import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/bloC/authentication_bloc/authentication_bloc.dart';
import 'package:reservation_system/bloc/event/authentication_event/authentication_event.dart';
import 'package:reservation_system/bloc/state/authentication_state/authentication_state.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/user.dart';
import 'package:reservation_system/models/validator_login/validator.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? currentPassword;

  @override
  void initState() {
    super.initState();
    final state = context.read<AuthenticationBloc>().state;
    if (state is AuththenticateSuccess) {
      currentPassword = state.user.password;
      currentPassController.text = currentPassword ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Password",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthenticationBloc>().add(
                  AuthInfoChanged(
                    userModel: User(password: newPasswordController.text),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('change Password success!')),
                );
                Navigator.pop(context);
              }
            },
            child: const Text(
              "Done",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipOval(
                    child: Image.asset(
                      Assets.images.imgMan.path,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.redAccent,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Form(
                key: _formKey,
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    var data = User();
                    if (state is AuththenticateSuccess) {
                      data = state.user;
                    }
                    currentPassController.text = data.password.toString();
                    return Column(
                      children: [
                        UITextInput(
                          hintText: "current Password",
                          type: 'password',
                          obscureText: true,
                          controller: currentPassController,
                          validator: Validator.validatePassword,
                        ),
                        const SizedBox(height: 10),
                        UITextInput(
                          hintText: "new Password",
                          type: "password",
                          obscureText: true,
                          controller: newPasswordController,
                          validator: Validator.validatePassword,
                        ),
                        const SizedBox(height: 10),
                        UITextInput(
                          hintText: "confirm Password",
                          type: "password",
                          obscureText: true,
                          controller: confirmPasswordController,
                          validator:
                              (value) => Validator.validateConfirmPassword(
                                value,
                                newPasswordController.text,
                              ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
