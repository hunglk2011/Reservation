import 'package:flutter/material.dart';

class TabButton extends StatefulWidget {
  final Map<int, String> tabItem;
  final Function(int) onTabSelected;
  const TabButton({
    super.key,
    required this.tabItem,
    required this.onTabSelected,
  });

  @override
  State<TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  int selectedtab = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 376.77,
      height: 52,
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              widget.tabItem.entries.map((entry) {
                int index = entry.key;
                String title = entry.value;
                bool isSelected = selectedtab == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedtab = index;
                    });
                    widget.onTabSelected(index);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border:
                          isSelected
                              ? Border(
                                bottom: BorderSide(
                                  color: Colors.redAccent,
                                  width: 2,
                                ),
                              )
                              : null,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
