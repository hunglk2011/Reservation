import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/presentation/home/home_component/menu_card.dart';
import 'package:reservation_system/presentation/home/home_component/reserve_button.dart';
import 'package:reservation_system/routes/route_named.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 16),
                Center(child: Image.asset(Assets.images.imgLogoBbq.path)),
                SizedBox(height: 12),
                state is AuththenticateSuccess
                    ? _buildLoggerInSection(context, state.user.name ?? "")
                    : _buildLogoutSection(context),
                SizedBox(height: 22),
                _buildMenuOptions(context),
                SizedBox(height: 24),
                _buildCompanyInfo(context),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _buildLoggerInSection(BuildContext context, String username) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.person_2_outlined, size: 54),
      SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          ReserveButton(
            text: "Edit profile",
            onPressed: () {
              Navigator.pushNamed(context, Routenamed.profilescreen);
            },
          ),
        ],
      ),
    ],
  );
}

Widget _buildLogoutSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.person_2_outlined, size: 54),
      SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Guest",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          ReserveButton(
            text: "SIGN UP",
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routenamed.signup);
            },
          ),
        ],
      ),
    ],
  );
}

Widget _buildMenuOptions(BuildContext context) {
  return Column(
    children: [
      MenuCard(
        name: "Home",
        iconName: Icon(Icons.home),
        onPressed: () {
          Navigator.pushNamed(context, Routenamed.homescreen);
        },
      ),
      MenuCard(
        name: "Reservation",
        iconName: Icon(Icons.settings),
        onPressed: () {
          Navigator.pushNamed(context, Routenamed.reservationHistory);
        },
      ),
      MenuCard(
        name: "About us",
        iconName: Icon(Icons.info),
        onPressed: () {
          Navigator.pushNamed(context, Routenamed.aboutus);
        },
      ),
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuththenticateSuccess) {
            return Column(
              children: [
                MenuCard(
                  name: "Log out",
                  iconName: Icon(Icons.logout),
                  onPressed: () async {
                    // context.read<AuthenticationBloc>().add(LogoutRequested());
                    Navigator.pushReplacementNamed(context, Routenamed.login);
                  },
                ),

                MenuCard(
                  name: "Change Password",
                  iconName: Icon(Icons.change_circle),
                  onPressed: () {
                    Navigator.pushNamed(context, Routenamed.changepass);
                  },
                ),
              ],
            );
          } else {
            return MenuCard(
              name: "Log in",
              iconName: Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routenamed.login);
              },
            );
          }
        },
      ),
    ],
  );
}

Widget _buildCompanyInfo(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Text(
      "Golden Gate Trading Service Joint Stock Company\n"
      "Head office: No. 60 Pho Duc Chinh Street, Nguyen Thai Binh Ward, District 1, HCMC, Vietnam\n"
      "GPK: 0102721191 issued on 09/04/2008\n"
      "Tel: 043 222 3000\n"
      "Email: support@anbbq.com.vn",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 12),
    ),
  );
}
