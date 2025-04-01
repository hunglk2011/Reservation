import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_bloc.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_event.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_state.dart';
import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/presentation/reservation_history/component/reservation_history_card.dart';
import 'package:reservation_system/routes/route_named.dart';

class ReservationHistory extends StatelessWidget {
  const ReservationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ReservationHistoryBloc()..add(FetchReservationHistory()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routenamed.homescreen);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authState) {
            if (authState is! AuththenticateSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Please login to use our services",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routenamed.login,
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              );
            }

            return BlocBuilder<ReservationHistoryBloc, ReservationHistoryState>(
              builder: (context, state) {
                if (state is ReservationHistoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                final reservations =
                    state is ReservationHistorySuccess
                        ? state.reservationList
                        : <Reservation>[];

                return SafeArea(
                  child: Column(
                    children: [
                      const Text(
                        "Your Reservation",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(child: _buildBody(reservations)),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Widget _buildBody(List<Reservation> reservations) {
  return ListView.builder(
    itemCount: reservations.length,
    itemBuilder: (context, index) {
      return ReservationHistoryCard(
        reservation: reservations[index],
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routenamed.reviewRestaurant,
            arguments: {"reservationKey": reservations[index].id.toString()},
          );
        },
      );
    },
  );
}
