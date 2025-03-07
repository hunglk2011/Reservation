import 'package:flutter/material.dart';
import 'package:reservation_system/presentation/home/home_component/menu_card.dart';
import 'package:reservation_system/presentation/home/home_component/reserve_button.dart';
import 'package:reservation_system/routes/route_named.dart';
import 'package:reservation_system/services/login_service.dart';

class DrawerMenu extends StatefulWidget {
  final String? userName;
  final String? email;
  final String? password;
  const DrawerMenu({super.key, this.userName, this.email, this.password});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    bool status = await LoginService.isLogin();
    setState(() {
      isLoggedIn = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 16),
            Center(child: Image.asset("asset/Logo.png")),
            SizedBox(height: 12),
            isLoggedIn
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_2_outlined, size: 54),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.userName ?? "",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        ReserveButton(
                          text: "Edit profile",
                          onPressed: () {
                            print(widget.userName);
                          },
                        ),
                      ],
                    ),
                  ],
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_2_outlined, size: 54),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.userName ?? "N/A",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        ReserveButton(
                          text: "SIGN UP",
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routenamed.signup,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
            SizedBox(height: 22),
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
              onPressed: () {},
            ),
            MenuCard(
              name: "About us",
              iconName: Icon(Icons.info),
              onPressed: () {},
            ),
            if (isLoggedIn) ...[
              MenuCard(
                name: "Log out",
                iconName: Icon(Icons.logout),
                onPressed: () async {
                  await LoginService.logout();
                  setState(() {
                    isLoggedIn = false;
                  });
                  Navigator.pushReplacementNamed(context, Routenamed.login);
                },
              ),
              MenuCard(
                name: "Change Password",
                iconName: Icon(Icons.logout),
                onPressed: () async {
                  await LoginService.logout();
                  setState(() {
                    isLoggedIn = false;
                  });
                  Navigator.pushReplacementNamed(context, Routenamed.login);
                },
              ),
            ] else ...[
              MenuCard(
                name: "Log in",
                iconName: Icon(Icons.logout),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routenamed.login);
                },
              ),
            ],
            SizedBox(height: 24),
            Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
