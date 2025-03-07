import 'package:flutter/material.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';
import 'package:reservation_system/presentation/home/data/home_data.dart';
import 'package:reservation_system/presentation/see_all/best_seller/best_seller_card.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Best Seller",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff483332),
              ),
            ),
            DropdownButton(
              items: [DropdownMenuItem(value: "ALL", child: Text("ALL"))],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: Column(children: [_buildBody(context)])),
      ),
    );
  }
}

Widget _buildBody(BuildContext context) => ListView.separated(
  physics: NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  itemBuilder: (context, index) {
    final product = HomePageData.products[index];

    return BestSellerCard(
      title: product.nameProduct,
      subtitle: product.descriptionProduct,
      imagePath: product.imageProduct ?? Assets.images.imgLogoIcon.path,
      onPressed: () async {
        List<Map<String, dynamic>>? savedFoods =
            AppPreference.getJsonData("reserved_foods") ?? [];

        savedFoods.add({
          "name": product.nameProduct,
          "description": product.descriptionProduct,
          "image": product.imageProduct ?? Assets.images.imgLogoIcon.path,
        });

        await AppPreference.saveJsonData("reserved_foods", savedFoods);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${product.nameProduct} has been reserved!")),
        );
      },
    );
  },
  separatorBuilder: (context, index) => Divider(),
  itemCount: HomePageData.products.length,
);
