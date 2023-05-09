import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets en fluter'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView.builder(
      itemBuilder: (context, index) {
        final item = appMenuItems[index];
        return ListTile(
            onTap: () {
              // todo navegar a otra pantall
            },
            title: Text(item.title),
            subtitle: Text(
              item.subTitle,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: colors.primary,
            ),
            leading: Icon(
              item.icon,
              color: colors.primary,
            ));
      },
      itemCount: appMenuItems.length,
    );
  }
}
