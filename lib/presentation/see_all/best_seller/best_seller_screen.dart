import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_dropdown_button.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/product.dart';
import 'package:reservation_system/services/product_service.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';
import 'package:reservation_system/presentation/see_all/best_seller/best_seller_card.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  List<Product> products = [];
  List<String> categories = ["All", "DESC STARS", "ASC STARS"];
  List<Product> filterProducts = [];
  String selectedCategory = "All";
  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() async {
    List<Product> product = await ProductService.getProductFromServer();
    setState(() {
      products = product;
      filterProducts = List.from(products);
    });
  }

  void filterCategories(String category) {
    setState(() {
      selectedCategory = category;
      switch (category) {
        case "DESC STARS":
          return filterProducts.sort(
            (a, b) => b.reviewCount!.compareTo(a.reviewCount!),
          );
        case "ASC STARS":
          return filterProducts.sort(
            (a, b) => a.reviewCount!.compareTo(b.reviewCount!),
          );
        default:
          filterProducts = List.from(products);
      }
    });
  }

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
            UIDropdownButton(
              itemList: categories,
              value: selectedCategory,
              onChanged: (value) {
                value != null ? filterCategories(value) : "";
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: _buildBody(context, filterProducts)),
      ),
    );
  }
}

Widget _buildBody(BuildContext context, List<Product> products) {
  return ListView.separated(
    physics: NeverScrollableScrollPhysics(),
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
    separatorBuilder: (context, index) => Divider(),
    itemCount: products.length,
  );
}
