import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 24,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromRGBO(107, 102, 166, 0.3),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      showSelectedLabels: true,
      unselectedLabelStyle: const TextStyle(fontSize: 0),
      selectedLabelStyle: const TextStyle(fontSize: 10),
      onTap: (value) {
        // Respond to item press.
      },
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        const BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.home_outlined),
        ),
        const BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.favorite),
        ),
        const BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.confirmation_number_outlined),
        ),
        const BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.supervised_user_circle_rounded),
        ),
        const BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.content_copy_outlined),
        ),
      ],
    );
  }
}
