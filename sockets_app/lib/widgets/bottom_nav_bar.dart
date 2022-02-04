import 'package:flutter/material.dart';

class bottomNaviBar extends StatelessWidget {
  const bottomNaviBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 2,
      backgroundColor: Color(0xFF2E305F),
      selectedItemColor: Color.fromRGBO(236, 98, 188, 1),
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_outlined), label: "Shop"),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: "Alarm"),
      ],
    );
  }
}
