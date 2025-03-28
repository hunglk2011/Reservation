import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reservation_system/models/class/reservation.dart';

class ReservationService {
  static const domain = "67cafc073395520e6af3e3aa.mockapi.io";
  static const header = {"Content-type": "application/json"};

  static Future<List<Reservation>> getReservationFromServer() async {
    var url = Uri.https(domain, "/reservation");
    var response = await http.get(url);
    final listJson = jsonDecode(response.body) as List<dynamic>;

    final List<Reservation> result =
        listJson.map((e) => Reservation.fromJson(e)).toList();
    return result;
  }

  static Future<Reservation?> getReservationById(String id) async {
    var url = Uri.https(domain, '/reservation/$id');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Reservation.fromJson(jsonData);
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return null;
    }
  }

  static Future<Reservation?> createNewReservation({
    required Reservation reservation,
  }) async {
    try {
      var url = Uri.https(domain, '/reservation');

      final reservationRequestData = reservation.toJson();

      final json = jsonEncode(reservationRequestData);
      var response = await http.post(url, headers: header, body: json);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return Reservation.fromJson(data);
      } else {
        print('Failed to create reservation: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error creating reservation: $e');
      return null;
    }
  }

  static Future<Reservation?> updateReservation({
    required Reservation reservation,
  }) async {
    try {
      var url = Uri.https(domain, '/reservation/${reservation.id}');
      final reservationRequestData = reservation.toJson();
      final json = jsonEncode(reservationRequestData);

      var response = await http.put(url, headers: header, body: json);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return Reservation.fromJson(data);
      } else {
        print('Failed to update reservation: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error updating reservation: $e');
      return null;
    }
  }
}
