import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/reservation_detail/reservation_detail_bloc.dart';
import 'package:reservation_system/bloc/reservation_detail/reservation_detail_event.dart';
import 'package:reservation_system/bloc/reservation_detail/reservation_detail_state.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/presentation/reservation_detail/component/timeline.dart';
import 'package:reservation_system/routes/route_named.dart';

class ReservationDetailScreen extends StatefulWidget {
  final String? reservationId;
  const ReservationDetailScreen({super.key, this.reservationId});

  @override
  State<ReservationDetailScreen> createState() =>
      _ReservationDetailScreenState();
}

class _ReservationDetailScreenState extends State<ReservationDetailScreen> {
  Reservation? reservationdata;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ReservationDetailBloc()..add(
                FetchReservationDetail(
                  reservationId: widget.reservationId.toString(),
                ),
              ),
      child: Scaffold(
        backgroundColor: Color(0xffF6EFE8),
        appBar: AppBar(
          backgroundColor: Color(0xffF6EFE8),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                Routenamed.reservationHistory,
              );
            },
          ),
        ),
        body: BlocBuilder<ReservationDetailBloc, ReservationDetailState>(
          builder: (context, state) {
            if (state is ReservationDetailSuccess) {
              reservationdata = state.reservationData;
            } else {
              reservationdata = null;
            }

            if (reservationdata == null) {
              return Center(child: CircularProgressIndicator());
            }

            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#${reservationdata!.id.toString()}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff483332),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 340,
                          height: 300,
                          child: Timeline(
                            reservationDate: reservationdata!.reservationDate,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildReservationInfo(context, reservationdata!),
                      SizedBox(height: 10),
                      _buildUserInfo(context, reservationdata!),
                      SizedBox(height: 10),
                      _buildWindowSeat(context),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          text: "Re - Reservation",
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routenamed.reservationscreen,
                              arguments: reservationdata?.restaurantInfo?.id,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _buildReservationInfo(
  BuildContext context,
  Reservation reservationData,
) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildInfoRow(
            Icons.location_on,
            // widget.reservation!.restaurantInfo?.address ?? "",
            reservationData.restaurantInfo?.nameRestaurant ??
                "Unknown Restaurant",
          ),
          _buildInfoRow(
            Icons.calendar_today,
            reservationData.reservationDate != null
                ? "${reservationData.reservationDate!.day}/${reservationData.reservationDate!.month}/${reservationData.reservationDate!.year}"
                : DateTime.now().toString(),
          ),

          _buildInfoRow(
            Icons.access_time,
            reservationData.timeRange != null
                ? reservationData.timeRange!
                : TimeOfDay.now().toString(),
          ),
          _buildInfoRow(Icons.people, reservationData.peopleCount.toString()),

          _buildInfoRow(Icons.note, reservationData.notes.toString()),
        ],
      ),
    ),
  );
}

Widget _buildUserInfo(BuildContext context, Reservation reservationData) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(Assets.images.imageInfo.path),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reservationData.userInfo?.name ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(reservationData.userInfo?.phoneNumber ?? ""),
              Text(reservationData.userInfo?.email ?? ""),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildInfoRow(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Icon(icon, color: Colors.red),
        SizedBox(width: 8),
        Expanded(child: Text(text, style: TextStyle(fontSize: 14))),
      ],
    ),
  );
}

Widget _buildWindowSeat(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.edit, color: Colors.red),
          SizedBox(width: 12),
          Text("Window seat", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
