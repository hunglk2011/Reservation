import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/product.dart';
import 'package:reservation_system/models/class/restaurant.dart';

class HomePageData {
  static List<Product> products = [
    Product(
      nameProduct: "Beef Ribs",
      descriptionProduct: "Good Beef",
      price: 15.00,
      imageProduct: Assets.images.imgProductBeef.path,
      address: "An Duong Vuong, Q5",
    ),
    Product(
      nameProduct: "Beef Bacon",
      descriptionProduct: "Excellent Dish",
      price: 15.00,
      imageProduct: Assets.images.imgProductBeef.path,
      address: "Xuan Dieu, Tan Binh",
    ),
    Product(
      nameProduct: "Fried Chicken",
      descriptionProduct: "Chicken",
      price: 15.00,
      imageProduct: Assets.images.imgProductBeef.path,
      address: "An Duong Vuong, Q5",
    ),
    Product(
      nameProduct: "Salad mix fruits",
      descriptionProduct: "Good Salad",
      price: 15.00,
      imageProduct: Assets.images.imgProductBeef.path,
      address: "An Duong Vuong, Q5",
    ),
  ];

  static List<Restaurant> restaurant = [
    Restaurant(
      nameRestaurant: "AN BBQ DONG KHOI",
      address:
          "Vincom Center, No. 70 Le Thanh Ton, Ben Nghe Ward, District 1, HCMC",
      image: Assets.images.imgRestaurant.path,
    ),
    Restaurant(
      nameRestaurant: "AN BBQ SU VAN HANH",
      address: "No. 716 Su Van Hanh, Ward 12, District 10, HCMC",
      image: Assets.images.imgRestaurant.path,
    ),
    Restaurant(
      nameRestaurant: "AN BBQ NGUYEN VAN CU",
      address: "No. 235 Nguyen Van Cu, Nguyen Cu Trinh Ward, District 10, HCMC",
      image: Assets.images.imgRestaurant.path,
    ),
    Restaurant(
      nameRestaurant: "AN BBQ PHAM VAN DONG",
      address: "50, Linh Trung Ward, District Binh Thanh, HCMC",
      image: Assets.images.imgRestaurant.path,
    ),
    Restaurant(
      nameRestaurant: "AN BBQ LE VAN SY",
      address: "50, 10 Ward, District 3, HCMC",
      image: Assets.images.imgRestaurant.path,
    ),
    Restaurant(
      nameRestaurant: "AN BBQ TRUONG CHINH",
      address: "50, 4 Ward, District Tan Binh, HCMC",
      image: Assets.images.imgRestaurant.path,
    ),
  ];
}
