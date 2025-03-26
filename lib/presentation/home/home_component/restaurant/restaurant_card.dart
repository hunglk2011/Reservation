import 'package:flutter/material.dart';
import 'package:reservation_system/presentation/home/home_component/reserve_button.dart';

class RestaurantCard extends StatefulWidget {
  final String nameRestaurant;
  final String address;
  final String? image;
  final VoidCallback? onchanged;
  final bool? hasDelete;
  final VoidCallback? onDelete;
  const RestaurantCard({
    super.key,
    required this.address,
    required this.nameRestaurant,
    this.image,
    this.onchanged,
    this.onDelete,
    this.hasDelete = true,
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 180,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.image.toString(),
                width: 327,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 90,
            child: Container(
              width: 300,
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nameRestaurant,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.address,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  widget.hasDelete == true
                      ? Row(
                        children: [
                          ReserveButton(
                            text: "reserve",
                            onPressed: widget.onchanged,
                          ),
                          IconButton(
                            onPressed: widget.onDelete,
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      )
                      : ReserveButton(
                        text: "reserve",
                        onPressed: widget.onchanged,
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
