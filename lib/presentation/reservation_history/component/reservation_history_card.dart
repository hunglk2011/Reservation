// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/reservation.dart';
import 'package:intl/intl.dart';

class ReservationHistoryCard extends StatelessWidget {
  final Reservation? reservation;
  final VoidCallback? onPressed;
  const ReservationHistoryCard({super.key, this.reservation, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 327,
        height: 112,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0x0f000000),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(Assets.images.imgLogoIcon.path),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reservation?.reservationDate != null
                                ? getFormattedDay(reservation!.reservationDate!)
                                : getFormattedDay(DateTime.now()),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff483332),
                            ),
                          ),
                          Text(
                            reservation?.reservationDate != null
                                ? DateFormat(
                                  'EEEE, MMMM',
                                ).format(reservation!.reservationDate!)
                                : DateFormat(
                                  'EEEE, MMMM',
                                ).format(DateTime.now()),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff483332),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "${reservation?.restaurantInfo?.nameRestaurant?.toString() ?? 'Unknown Restaurant'}\n"
                  "${reservation?.peopleCount?.toString() ?? '0'}, "
                  "${reservation?.timeRange?.toString() ?? 'Unknown'}",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff483332),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#${reservation?.id.toString()}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff483332),
                    ),
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.chevron_right),
                  ),
                  Container(
                    width: 58,
                    height: 18,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Center(
                      child: Text(
                        "Finished",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getFormattedDay(DateTime date) {
  int day = date.day;
  String suffix = "th";

  if (day == 1 || day == 21 || day == 31) {
    suffix = "st";
  } else if (day == 2 || day == 22)
    suffix = "nd";
  else if (day == 3 || day == 23)
    suffix = "rd";

  return "$day$suffix";
}
