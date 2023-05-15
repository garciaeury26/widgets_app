import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  final String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar')),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar'),
        onPressed: () => showSnackBar(context),
        icon: const Icon(Icons.remove_red_eye),
      ),
      body: Center(
        child: Column(children: [
          FilledButton.tonal(
              onPressed: () {
                // mostrar caja de dialogo
                showAboutDialog(context: context, children: [
                  const Text(
                      'Lorem ldasdmsakdlklk lkk ;lkda;lskdl;askdksald;kads;;lk')
                ]);
              },
              child: const Text('Licencias usadas')),
          const SizedBox(height: 20),
          FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar Dialogo')),
        ]),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        // para que necesariamente tenga que cerrarse con un botton
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('Estas seguro'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                TextButton(
                    onPressed: () => context.pushReplacement('/'),
                    child: const Text('Aceptar')),
              ],
              content: const Text(
                  'Consequat ad consequat ad excepteur ea. Nostrud ad dolore cupidatat aute aliqua sint qui eiusmod. Ullamco ipsum sit nulla tempor consequat non. Ex Lorem do eu reprehenderit consequat. Esse sint culpa aute pariatur sunt culpa duis consectetur est qui ullamco consequat cupidatat occaecat. Reprehenderit reprehenderit sint voluptate pariatur laboris mollit laboris Lorem sunt pariatur laboris.'),
            ));
  }

  void showSnackBar(BuildContext context) {
    // limpiar el anterior
    ScaffoldMessenger.of(context).clearSnackBars();
    // creacion del SnackBar
    final snackBar = SnackBar(
      content: const Text('Hola eury'),
      duration: const Duration(milliseconds: 1000),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
    );
    // Mostrar el SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
