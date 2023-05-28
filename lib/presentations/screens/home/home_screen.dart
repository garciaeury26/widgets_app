import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentations/screens/drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // este scalfoldKey tiene toda la referencia del estado del scalfold
    final scalfoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scalfoldKey,
      appBar: AppBar(
        title: const Text('Widgets en fluter'),
      ),
      body: _HomeView(),
      drawer: SideMenu(
        scalfoldKey: scalfoldKey,
      ),
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
              // navegar => pude ser push,replace, etc
              // Navigator.of(context).push(
              //   // puedo mandar argumentos
              // MaterialPageRoute(builder: (context) => const ButtonScreen()));

              //*  Recondemendada 1
              // Navigator.pushNamed(context, item.link);

              // * Recomenda para la mayoria de proyectos
              context.push(item.link);
              // * rutas con nombres
              // context.pushNamed(ButtonScreen.routerName);
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
