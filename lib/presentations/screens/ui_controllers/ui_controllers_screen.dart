import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiScreenControllers extends StatelessWidget {
  final String name = 'ui_controllers_screen';

  const UiScreenControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ui controls'),
      ),
      body: _UiScreenControllersView(),
    );
  }
}

class _UiScreenControllersView extends StatefulWidget {
  const _UiScreenControllersView();

  @override
  State<_UiScreenControllersView> createState() =>
      _UiScreenControllersViewState();
}

enum Transportation { car, airplane }

class _UiScreenControllersViewState extends State<_UiScreenControllersView> {
  bool swichButton = true;
  Transportation transportation = Transportation.car;
  bool check_box = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SwitchListTile
        SwitchListTile(
          value: swichButton,
          onChanged: (value) {
            setState(() {
              swichButton = !swichButton;
            });
          },
          title: const Text('Is developer'),
          subtitle: const Text('Controles adicionales.'),
        ),

        //  RadioListTile
        RadioListTile(
            title: const Text('Car'),
            subtitle: const Text('subtitle'),
            value: Transportation.car,
            groupValue: transportation,
            onChanged: (value) => setState(() {
                  transportation = Transportation.car;
                })),

        RadioListTile(
            title: const Text('Airplane'),
            subtitle: const Text('subtitle'),
            value: Transportation.airplane,
            groupValue: transportation,
            onChanged: (value) => setState(() {
                  // print(value);
                  transportation = Transportation.airplane;
                })),

        ExpansionTile(
          title: const Text('Tranportations options'),
          subtitle: Text('$transportation'),
          children: [
            RadioListTile(
                title: const Text('Car'),
                subtitle: const Text('subtitle'),
                value: Transportation.car,
                groupValue: transportation,
                onChanged: (value) => setState(() {
                      transportation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text('Airplane'),
                subtitle: const Text('subtitle'),
                value: Transportation.airplane,
                groupValue: transportation,
                onChanged: (value) => setState(() {
                      // print(value);
                      transportation = Transportation.airplane;
                    })),
          ],
        ),

        CheckboxListTile(
          title: const Text('Card'),
          subtitle: const Text('subtitle'),
          value: check_box,
          onChanged: (value) {
            setState(() {
              check_box = !check_box;
            });
          },
        )
      ],
    );
  }
}
