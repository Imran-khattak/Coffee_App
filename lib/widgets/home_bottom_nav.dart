import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.white,
          spreadRadius: 1,
          blurRadius: 8,
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.home,
            size: 35,
            color: Color(0xff7A3E26),
          ),
          Icon(
            Icons.favorite_outlined,
            size: 35,
            color: Colors.black,
          ),
          Icon(
            Icons.notifications,
            size: 35,
            color: Colors.black,
          ),
          Icon(
            Icons.person,
            size: 35,
            color: Color(0xff7A3E26),
          )
        ],
      ),
    );
  }
}
