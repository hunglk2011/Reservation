import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_bloc.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_event.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_state.dart';
import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/presentation/reservation_history/component/reservation_history_card.dart';
import 'package:reservation_system/routes/route_named.dart';

class ReservationHistory extends StatefulWidget {
  const ReservationHistory({super.key});

  @override
  State<ReservationHistory> createState() => _ReservationHistoryState();
}

class _ReservationHistoryState extends State<ReservationHistory> {
  List<Reservation> reservations = [];
  @override
  void initState() {
    super.initState();
  }

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
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: BlocBuilder<ReservationHistoryBloc, ReservationHistoryState>(
          builder: (context, state) {
            if (state is ReservationHistoryLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ReservationHistorySuccess) {
              reservations = List.from(state.reservationList);
            }

            return SafeArea(
              child: Column(
                children: [
                  Text(
                    "Your Reservation",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: _buildBody(context, reservations)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _buildBody(BuildContext context, List<Reservation> reservations) {
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
