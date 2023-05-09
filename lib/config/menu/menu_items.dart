import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botonones',
      subTitle: 'varios botones en flutter',
      link: '/home',
      icon: Icons.home),
  MenuItem(
      title: 'Targetas',
      subTitle: 'Un contenedor estilizado',
      link: '/buttons',
      icon: Icons.home),
  MenuItem(
      title: 'Home', subTitle: 'Home', link: 'home', icon: Icons.credit_card),
];
