import 'package:first_app/Widget/product_card.dart';
import 'package:first_app/presentation/home/home_page_data.dart';
import 'package:flutter/material.dart';

class SectionList extends StatelessWidget {
  final String title;
  const SectionList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff483332)),
              ),
              Text(
                "See All",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff999999),
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 210,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: HomePageData.products.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ProductCard(
                  nameProduct: HomePageData.products[index].nameProduct,
                  address: HomePageData.products[index].address ?? "",
                  image: HomePageData.products[index].imageProduct,
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
        ],
      ),
    );
  }
}
