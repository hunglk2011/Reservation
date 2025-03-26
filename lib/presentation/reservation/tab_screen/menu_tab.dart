import 'package:flutter/material.dart';
import 'package:reservation_system/presentation/home/data/home_data.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/menu_card.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(child: Column(children: [_BuildBody()])),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: HomePageData.products.length,
      itemBuilder: (context, index) {
        return MenuCard(product: HomePageData.products[index]);
      },
    );
  }
}
