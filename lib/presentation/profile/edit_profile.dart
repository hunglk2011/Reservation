import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_event.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/user.dart';
import 'package:reservation_system/models/validator_login/validator.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<AuthenticationBloc>().state;
    if (state is AuththenticateSuccess) {
      nameController.text = state.user.name ?? "";
      phoneController.text = state.user.phoneNumber ?? "";
      emailController.text = state.user.email ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
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
                var userData = User(
                  name: nameController.text,
                  phoneNumber: phoneController.text,
                  email: emailController.text,
                );
                context.read<AuthenticationBloc>().add(
                  AuthInfoChanged(userModel: userData),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit user info success!')),
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
                child: Column(
                  children: [
                    UITextInput(
                      hintText: "Name",
                      type: "text",
                      controller: nameController,
                      validator: Validator.validateName,
                    ),
                    const SizedBox(height: 10),
                    UITextInput(
                      hintText: "Phone Number",
                      type: "number",
                      controller: phoneController,
                      validator: Validator.validatePhoneNumber,
                    ),
                    const SizedBox(height: 10),
                    UITextInput(
                      hintText: "Email",
                      type: "email",
                      controller: emailController,
                      validator: Validator.validateEmail,
                    ),
                  ],
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
