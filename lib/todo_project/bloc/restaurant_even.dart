sealed class RestaurantEven {}

class RestaurantRefresh extends RestaurantEven {}

class RestaurantCreate extends RestaurantEven {
  final String nameRestaurant;
  final String address;
  final String image;
  RestaurantCreate({
    required this.nameRestaurant,
    required this.address,
    required this.image,
  });
}
