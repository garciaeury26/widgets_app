import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: const _CardsViews(),
    );
  }
}

class _CardsViews extends StatelessWidget {
  const _CardsViews();

  @override
  Widget build(BuildContext context) {
    // este widget me permite tener un scroll para los elementos que se sobresalen
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
              (e) => CardType1(label: e['label'], elevation: e['Elevation'])),
          ...cards.map(
              (e) => CardType1(label: e['label'], elevation: e['Elevation'])),
          ...cards.map(
              (e) => CardType2(label: e['label'], elevation: e['Elevation'])),
          ...cards.map(
              (e) => CardType3(label: e['label'], elevation: e['Elevation'])),
          // para que tanga un espacio en el bottom
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const CardType1({super.key, required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).colorScheme;

    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: myColors.outline, width: 1.7),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(children: [
          const Align(
              alignment: Alignment.bottomRight, child: Icon(Icons.more_vert)),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(label),
          )
        ]),
      ),
    );
  }
}

class CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const CardType2({super.key, required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).colorScheme;

    return Card(
      color: myColors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(children: [
          const Align(
              alignment: Alignment.bottomRight, child: Icon(Icons.more_vert)),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(label),
          )
        ]),
      ),
    );
  }
}

class CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const CardType3({super.key, required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,// esto ase que los hijos no se salgan del padre
      elevation: elevation,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                  child: Image.network(
                      'https://th.bing.com/th/id/OIP.ApdJF8Zu5FjPRhkCW80fBgHaIq?pid=ImgDet&rs=1',height: 250,fit: BoxFit.cover,))
            ],
          )),
    );
  }
}

const cards = <Map<String, dynamic>>[
  {'Elevation': 1.0, 'label': 'Elevation 1'},
  {'Elevation': 2.0, 'label': 'Elevation 2'},
  {'Elevation': 3.0, 'label': 'Elevation 3'},
  {'Elevation': 4.0, 'label': 'Elevation 4'},
  {'Elevation': 5.0, 'label': 'Elevation 5'},
];
