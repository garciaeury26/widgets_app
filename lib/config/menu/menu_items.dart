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
  MenuItem(title: 'home', subTitle: 'home', link: '/', icon: Icons.home),
  MenuItem(
      title: 'Buttons',
      subTitle: 'Butons',
      link: '/buttons',
      icon: Icons.access_alarms_outlined),
  MenuItem(
      title: 'Targetas',
      subTitle: 'targetas',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Genrales y controlados',
      link: '/pogress',
      icon: Icons.refresh),
  MenuItem(
      title: 'SnackBar y dialogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbar',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'Stales full widget animado',
      link: '/animacion',
      icon: Icons.check_box_outline_blank),
  MenuItem(
      title: 'Ui controllers',
      subTitle: 'radio buttons, checkbox, swich etc',
      link: '/uicontrols',
      icon: Icons.check_box),
  MenuItem(
      title: 'Tutorial page view',
      subTitle: 'radio buttons, checkbox, swich etc',
      link: '/tutorial',
      icon: Icons.android),
  MenuItem(
      title: 'Infinite scrooll y pull to refresh',
      subTitle: 'radio buttons, checkbox, swich etc',
      link: '/infiniteScroll',
      icon: Icons.list),
  MenuItem(
      title: 'Counter screen',
      subTitle: 'introduccion a reverpood',
      link: '/counter',
      icon: Icons.add),
  MenuItem(
      title: 'Theme',
      subTitle: 'Theme configuration',
      link: '/theme',
      icon: Icons.palette),
];
