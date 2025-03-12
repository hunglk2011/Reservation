import 'package:flutter/material.dart';

class PeopleSection extends StatefulWidget {
  const PeopleSection({super.key, required this.title, this.onPress});

  final String title;
  final VoidCallback? onPress;

  @override
  State<PeopleSection> createState() => _PeopleSectionState();
}

class _PeopleSectionState extends State<PeopleSection> {
  int numberPeople = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [_buildTitle(context)],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff483332),
            ),
          ),
          Row(
            children: [
              countBox(context, Icon(Icons.remove), () {
                setState(() {
                  if (numberPeople > 0) {
                    numberPeople--;
                  }
                });
              }),
              Text(numberPeople.toString()),
              countBox(context, Icon(Icons.add), () {
                setState(() {
                  numberPeople++;
                });
              }),
            ],
          ),
        ],
      ),
    );
  }
}

Widget countBox(BuildContext context, Icon iconbox, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            color: Colors.black87,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(iconbox.icon, color: Colors.black, size: 12),
      ),
    ),
  );
}
