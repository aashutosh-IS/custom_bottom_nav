import 'package:custom_bottom_nav/src/nav_bar_item.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav(
      {super.key,
      required this.items,
      required this.index,
      required this.onIndexChanged,
      this.selectionColor});

  final List<NavBarItem> items;
  final int index;
  final Function(int) onIndexChanged;
  final Color? selectionColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0XFF321F44),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items
            .asMap()
            .map(
              (index, e) => MapEntry(
                index,
                InkWell(
                  onTap: () => onIndexChanged(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == this.index
                              ? selectionColor ??
                                  const Color(0XFFD7E070).withOpacity(0.1)
                              : Colors.transparent,
                        ),
                        child: Image.asset(
                          index == this.index ? e.selectedIconPath : e.iconPath,
                          height: 25,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        e.title,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: index == this.index
                              ? const Color(0XFFD7E070)
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
