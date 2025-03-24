import 'package:flutter/material.dart';
import 'package:reservation_system/component/section/ui_section.dart';
import 'package:reservation_system/presentation/home/data/home_data.dart';
import 'package:reservation_system/presentation/home/home_component/product_card.dart';
import 'package:reservation_system/routes/route_named.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return UISection(
      title: 'Best seller',
      body: _buildBody(context),
      onPress: () {
        Navigator.pushNamed(context, Routenamed.seeAllBestSeller);
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ProductCard(
            nameProduct: HomePageData.products[index].nameProduct,
            address: HomePageData.products[index].address ?? "",
            image: HomePageData.products[index].imageProduct,
            onchanged: () {
              Navigator.pushNamed(
                context,
                Routenamed.reservationscreen,
                arguments: HomePageData.products[index].id.toString(),
              );
            },
          );
        },
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }
}
