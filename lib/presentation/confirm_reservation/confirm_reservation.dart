import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/routes/route_named.dart';

class ConfirmReservation extends StatefulWidget {
  final Reservation? reservation;
  const ConfirmReservation({super.key, this.reservation});

  @override
  State<ConfirmReservation> createState() => _ConfirmReservationState();
}

class _ConfirmReservationState extends State<ConfirmReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.images.imgRestaurantBackground.path,
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.66,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHeader(context),
                      SizedBox(height: 16),
                      _buildReservationInfo(),
                      SizedBox(height: 16),
                      _buildUserInfo(),
                      SizedBox(height: 16),
                      _buildDeposit(context),
                      SizedBox(height: 16),
                      CustomButton(
                        text: "Reservation",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routenamed.payment,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Your Reservation",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.close)),
      ],
    );
  }

  Widget _buildReservationInfo() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xffF6EFE8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            _buildInfoRow(
              Icons.location_on,
              widget.reservation!.restaurantInfo?.address ?? "",
            ),
            _buildInfoRow(
              Icons.calendar_today,
              widget.reservation!.reservationDate != null
                  ? "${widget.reservation!.reservationDate!.day}/${widget.reservation!.reservationDate!.month}/${widget.reservation!.reservationDate!.year}"
                  : DateTime.now().toString(),
            ),

            _buildInfoRow(
              Icons.access_time,
              widget.reservation!.timeRange != null
                  ? widget.reservation!.timeRange!
                  : TimeOfDay.now().toString(),
            ),
            _buildInfoRow(
              Icons.people,
              widget.reservation!.peopleCount.toString(),
            ),

            _buildInfoRow(Icons.note, widget.reservation!.notes.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xffF6EFE8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.reservation!.userInfo?.name ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.reservation!.userInfo?.phoneNumber ?? ""),
                Text(widget.reservation!.userInfo?.email ?? ""),
              ],
            ),
          ],
        ),
      ),
    );
  }
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

Widget _buildDeposit(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xffF6EFE8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.money),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your deposit is 200,000VND',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Please pay within 30 minutes, if not, your reservation will be canceled automatically.',
                        style: TextStyle(fontSize: 12, color: Colors.red),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
