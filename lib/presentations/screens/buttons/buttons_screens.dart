import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {
  // para acceder a las rutas por nombro => opcional
  static const routerName = 'home_screen';

  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          // eliminar pantalla y regresar ala anterior
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(9)),
      child: SizedBox(
        width: double.infinity, // llegara al maximo del padre
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SizedBox(
            child: Wrap(
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Elevate Buttons')),
                  const ElevatedButton(
                      onPressed: null, child: Text('Elevate disable')),
                  FilledButton(
                      onPressed: () {}, child: const Text('Filled buttons')),
                  FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.heart_broken),
                      label: const Text('Filled icon')),
                  OutlinedButton(
                      onPressed: () {}, child: const Text('Outline')),
                  OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.adb_outlined),
                      label: const Text('Outline icons')),
                  TextButton(onPressed: () {}, child: const Text('Text')),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_box_outlined),
                    label: const Text('text icon'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(myColors.surface)),
                  ),
                  const CustomButton()
                ]),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Cada widget dentro de Material tiene un aspecto y comportamiento coherente con el lenguaje de diseño visual de Material Design
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.blueAccent,
        // La función principal de InkWell es proporcionar una respuesta táctil y visual para el usuario al tocar una parte específica de la interfaz de usuario,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola'),
          ),
        ),
      ),
    );
  }
}
