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
  int selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children:
            widget.tabItem.entries.map((entry) {
              int index = entry.key;
              String title = entry.value;
              bool isSelected = selectedTab == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = index;
                    });
                    widget.onTabSelected(index);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
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
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
