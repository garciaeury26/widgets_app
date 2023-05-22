import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      children: const [
        SizedBox(
          height: 20,
        ),
        NavigationDrawerDestination(
            icon: Icon(Icons.add), label: Text('Add Data')),
        NavigationDrawerDestination(
            icon: Icon(Icons.add), label: Text('Add Data')),
        NavigationDrawerDestination(
            icon: Icon(Icons.add), label: Text('Add Data')),
      ],
    );
  }
}
