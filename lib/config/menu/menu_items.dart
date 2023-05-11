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
      title: 'home',
      subTitle: 'home',
      link: '/',
      icon: Icons.home),
  MenuItem(
      title: 'Buttons',
      subTitle: 'Butons',
      link: '/buttons',
      icon: Icons.access_alarms_outlined),
  MenuItem(
      title: 'Targetas', subTitle: 'targetas', link: '/cards', icon: Icons.credit_card),
];
