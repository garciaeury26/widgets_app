import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scalfoldKey;

  const SideMenu({super.key, required this.scalfoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // verificar si tiene el noch
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
          selectedIndex = value;
        });
        final menuItem = appMenuItems[value];
        context.pushNamed(menuItem.link);
        // cerrar drawer
        widget.scalfoldKey.currentState?.closeDrawer();
      },
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Amazon'),
        ),
        ...appMenuItems.sublist(0, 3).map(
          (item) {
            return NavigationDrawerDestination(
                icon: Icon(item.icon), label: Text(item.title));
          },
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 10),
          child: const Divider(),
        ),
        ...appMenuItems.sublist(3).map(
          (item) {
            return NavigationDrawerDestination(
                icon: Icon(item.icon), label: Text(item.title));
          },
        ),
      ],
    );
  }
}
