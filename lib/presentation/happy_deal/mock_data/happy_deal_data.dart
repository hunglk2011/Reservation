import 'package:reservation_system/models/class/happy_deal.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/services/restaurant_service.dart';

class HappyDealData {
  static Future<List<HappyDeal>> getMockHappyDeals() async {
    List<Restaurant> restaurants =
        await RestaurantService.getRestaurantFromServer();

    if (restaurants.isEmpty) {
      return [];
    }

    return [
      HappyDeal(
        id: "hd_001",
        name: "Weekend Special",
        description: "Get 30% OFF on all main courses this weekend!",
        discountPercent: 30,
        expiryDate: DateTime(2025, 4, 15),
        restaurant: restaurants[0],
      ),
      HappyDeal(
        id: "hd_002",
        name: "Buy 1 Get 1 Free",
        description: "Buy one pizza, get another absolutely free!",
        discountPercent: 50,
        expiryDate: DateTime(2025, 4, 20),
        restaurant: restaurants.length > 1 ? restaurants[1] : restaurants[0],
      ),
      HappyDeal(
        id: "hd_003",
        name: "Happy Hours",
        description: "Flat 25% OFF on all drinks from 5 PM - 7 PM.",
        discountPercent: 25,
        expiryDate: DateTime(2025, 4, 10),
        restaurant: restaurants.length > 2 ? restaurants[2] : restaurants[0],
      ),
      HappyDeal(
        id: "hd_004",
        name: "Lunch Combo Offer",
        description: "Enjoy a 3-course meal at just \$9.99!",
        discountPercent: 20,
        expiryDate: DateTime(2025, 4, 18),
        restaurant: restaurants.length > 3 ? restaurants[3] : restaurants[0],
      ),
      HappyDeal(
        id: "hd_005",
        name: "Seafood Festival",
        description: "Get 15% OFF on all seafood platters.",
        discountPercent: 15,
        expiryDate: DateTime(2025, 5, 5),
        restaurant: restaurants.length > 4 ? restaurants[4] : restaurants[0],
      ),
    ];
  }
}
