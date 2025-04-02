import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_bloc.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_event.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_state.dart';
import 'package:reservation_system/component/button/ui_dropdown_button.dart';
import 'package:reservation_system/component/loading/ui_shimmer.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/product.dart';
import 'package:reservation_system/presentation/see_all/best_seller/best_seller_card.dart';

import '../../../component/dialog/ui_dialog.dart';
import '../../../routes/route_named.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  List<String> categories = ["All", "DESC STARS", "ASC STARS"];
  List<Product> filterProducts = [];
  String selectedCategory = "All";
  List<Product> allProducts = [];

  void filterCategories(String category) {
    if (allProducts.isEmpty) return;

    List<Product> sortedProducts = List.from(allProducts);
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
                    filterCategories(value);
                  }
                },
              ),
            ],
          ),
        ),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authState) {
            return BlocBuilder<RestaurantListBloc, RestaurantListState>(
              builder: (context, listState) {
                if (listState is RestaurantListLoading) {
                  return UiShimmer();
                } else if (listState is RestaurantListFetchSuccess) {
                  allProducts =
                      listState.restaurants
                          .map((restaurant) => restaurant.product)
                          .whereType<Product>()
                          .toList();

                  return SingleChildScrollView(
                    child: SafeArea(
                      child:
                          authState is AuththenticateSuccess
                              ? _buildBody(
                                context,
                                filterProducts.isNotEmpty
                                    ? filterProducts
                                    : allProducts,
                              )
                              : _buildBodyNoLogin(
                                context,
                                filterProducts.isNotEmpty
                                    ? filterProducts
                                    : allProducts,
                              ),
                    ),
                  );
                }
                return const Center(child: Text("No data available"));
              },
            );
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
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routenamed.reservationscreen,
            arguments: products[index].idProduct,
          );
        },
      );
    },
    separatorBuilder: (context, index) => const SizedBox(height: 6),
    itemCount: products.length,
  );
}

Widget _buildBodyNoLogin(BuildContext context, List<Product> products) {
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
        onPressed: () {
          UiDialog.show(
            context,
            title: "Information",
            content: Text("Please login to use our services"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routenamed.login);
                },
                child: Text("Login"),
              ),
            ],
          );
        },
      );
    },
    separatorBuilder: (context, index) => const SizedBox(height: 6),
    itemCount: products.length,
  );
}
