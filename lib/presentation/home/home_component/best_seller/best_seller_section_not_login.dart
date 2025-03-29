import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_bloc.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_event.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_state.dart';
import 'package:reservation_system/component/section/ui_section.dart';
import 'package:reservation_system/models/class/product.dart';
import 'package:reservation_system/presentation/home/home_component/product_card.dart';
import 'package:reservation_system/routes/route_named.dart';

import '../../../../component/dialog/ui_dialog.dart';

class BestSellerSectionNotLogin extends StatelessWidget {
  const BestSellerSectionNotLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantListBloc()..add(FetchRestaurantList()),
      child: BlocBuilder<RestaurantListBloc, RestaurantListState>(
        builder: (context, state) {
          if (state is RestaurantListFetchFailure ||
              state is RestaurantListLoading) {
            return UISection(
              title: "Best Seller",
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is RestaurantListFetchSuccess) {
            final List<Product> result =
                state.restaurants
                    .map((restaurant) => restaurant.product)
                    .whereType<Product>()
                    .toList();

            return SizedBox(
              height: 300,
              child: UISection(
                title: 'Best seller',
                body: BuildBody(products: result),
                onPress: () {
                  Navigator.pushNamed(context, Routenamed.seeAllBestSeller);
                },
              ),
            );
          }
          return UISection(
            title: "Best Seller",
            body: Center(child: Text("No data available")),
          );
        },
      ),
    );
  }
}

class BuildBody extends StatelessWidget {
  final List<Product> products;
  const BuildBody({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            nameProduct: products[index].nameProduct,
            address: products[index].address ?? "280 An Duong Vuong",
            image: products[index].imageProduct,
            onchanged: () {
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
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }
}
