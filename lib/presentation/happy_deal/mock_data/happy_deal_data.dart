import '../../../models/class/happy_deal.dart';
import '../../../models/class/reservation.dart';
import '../../../models/class/restaurant.dart';
import '../../../models/class/user.dart';

class HappyDealData {
  static List<HappyDeal> mockHappyDeals = [
    HappyDeal(
      id: "HD001",
      reservation: Reservation(
        id: "R001",
        createdDate: DateTime.now().subtract(Duration(days: 5)),
        reservationDate: DateTime.now().add(Duration(days: 2)),
        peopleCount: 4,
        timeRange: "19:00 - 21:00",
        status: ReservationStatus.confirmed,
        amount: 500000,
        restaurantInfo: Restaurant(
          id: "RES001",
          nameRestaurant: "The Steak House",
        ),
        userInfo: User(id: "U001", name: "John Doe"),
        notes: "Table near the window",
      ),
    ),
    HappyDeal(
      id: "HD002",
      reservation: Reservation(
        id: "R002",
        createdDate: DateTime.now().subtract(Duration(days: 3)),
        reservationDate: DateTime.now().add(Duration(days: 5)),
        peopleCount: 2,
        timeRange: "12:00 - 14:00",
        status: ReservationStatus.pending,
        amount: 250000,
        restaurantInfo: Restaurant(id: "RES002", nameRestaurant: "Sushi World"),
        userInfo: User(id: "U002", name: "Alice Smith"),
        notes: "Vegan options needed",
      ),
    ),
    HappyDeal(
      id: "HD003",
      reservation: Reservation(
        id: "R003",
        createdDate: DateTime.now().subtract(Duration(days: 7)),
        reservationDate: DateTime.now().add(Duration(days: 3)),
        peopleCount: 6,
        timeRange: "18:00 - 20:00",
        status: ReservationStatus.cancelled,
        amount: 750000,
        restaurantInfo: Restaurant(
          id: "RES003",
          nameRestaurant: "Italiano Bistro",
        ),
        userInfo: User(id: "U003", name: "Michael Johnson"),
        notes: "Birthday celebration",
      ),
    ),
  ];
}
