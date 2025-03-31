import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_bloc.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_event.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_state.dart';
import 'package:reservation_system/component/button/ui_dropdown_button.dart';
import 'package:reservation_system/component/loading/ui_shimmer.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/product.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';
import 'package:reservation_system/presentation/see_all/best_seller/best_seller_card.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  List<String> categories = ["All", "DESC STARS", "ASC STARS"];
  List<Product> filterProducts = [];
  String selectedCategory = "All";

  void filterCategories(String category, List<Product> products) {
    if (products.isEmpty) return;

    List<Product> sortedProducts = List.from(products);
    switch (category) {
      case "DESC STARS":
        sortedProducts.sort(
          (a, b) => (b.reviewCount ?? 0).compareTo(a.reviewCount ?? 0),
        );
        break;
      case "ASC STARS":
        sortedProducts.sort(
          (a, b) => (a.reviewCount ?? 0).compareTo(b.reviewCount ?? 0),
        );
        break;
    }

    setState(() {
      selectedCategory = category;
      filterProducts = sortedProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantListBloc()..add(FetchRestaurantList()),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Best Seller",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff483332),
                ),
              ),
              UIDropdownButton(
                itemList: categories,
                value: selectedCategory,
                onChanged: (value) {
                  if (value != null) {
                    filterCategories(value, filterProducts);
                  }
                },
              ),
            ],
          ),
        ),
        body: BlocBuilder<RestaurantListBloc, RestaurantListState>(
          builder: (context, state) {
            if (state is RestaurantListLoading) {
              return UiShimmer();
            } else if (state is RestaurantListFetchSuccess) {
              List<Product> allProducts =
                  state.restaurants
                      .map((restaurant) => restaurant.product)
                      .whereType<Product>()
                      .toList();

              return SingleChildScrollView(
                child: SafeArea(
                  child: _buildBody(
                    context,
                    filterProducts.isNotEmpty ? filterProducts : allProducts,
                  ),
                ),
              );
            }
            return const Center(child: Text("No data available"));
          },
        ),
      ),
    );
  }
}

Widget _buildBody(BuildContext context, List<Product> products) {
  if (products.isEmpty) {
    return const Center(child: Text("No best sellers found."));
  }
  return ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return BestSellerCard(
        title: products[index].nameProduct,
        subtitle: products[index].descriptionProduct,
        imagePath:
            products[index].imageProduct ?? Assets.images.imgLogoIcon.path,
        reviewCount: products[index].reviewCount,
        onPressed: () async {
          List<Map<String, dynamic>>? savedFoods =
              AppPreference.getJsonData("reserved_foods") ?? [];

          savedFoods.add({
            "name": products[index].nameProduct,
            "description": products[index].descriptionProduct,
            "image":
                products[index].imageProduct ?? Assets.images.imgLogoIcon.path,
          });

          await AppPreference.saveJsonData("reserved_foods", savedFoods);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "${products[index].nameProduct} has been reserved!",
              ),
            ),
          );
        },
      );
    },
    separatorBuilder: (context, index) => const Divider(),
    itemCount: products.length,
  );
}
