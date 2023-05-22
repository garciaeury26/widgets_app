import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:go_router/go_router.dart';

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});
  final String name = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late PageController pageViewController = PageController();
  bool finishTutorial = false;

  @override
  // esto viene siendo un useEffect
  void initState() {
    super.initState();

    // esta funcion se actualiza cada vez que se ase scroll
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!finishTutorial && page >= (slides.length - 1.5)) {
        setState(() {
          finishTutorial = true;
        });
      }
      // => manda valores decimales mientras se asflutter pub add animate_doe el sluder
      // print('page $pageViewController.page');
    });
  }

  @override
  void dispose() {
    super.dispose();
    // siempre que asinamos un controller tenemos desmontarlo del arbol de widgets
    // cuando se desmonta
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            scrollDirection: Platform.isLinux ? Axis.vertical : Axis.horizontal,
            children: slides
                .map((e) => _Slide(
                    title: e.title, caption: e.caption, imageUrl: e.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                onPressed: () => context.pop(),
                child: const Text('Salir'),
              )),
          finishTutorial
              ? Positioned(
                  right: 20,
                  bottom: 50,
                  child: FadeInRight(
                    from: 15,
                    duration: const Duration(milliseconds: 400),
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('Empezar'),
                    ),
                  ))
              // ? se recomienda usar SizeBox cuando no se quire representar nada
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(height: 350, image: AssetImage(imageUrl)),
                Text(
                  'Entrega rapida',
                  style: textStyle.titleLarge,
                ),
                Text(
                  'Aute laboris laborum dolor sint commodo amet cupidatat elit ipsum ipsum aute.',
                  style: textStyle.bodyMedium,
                ),
              ]),
        ),
      ),
    );
  }
}

class SliderInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SliderInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SliderInfo>[
  SliderInfo(
      title: 'Busco la comida',
      caption:
          'Elit consequat amet id id sit. Sit in amet non nisi aute. Irure mollit consectetur commodo eiusmod. Consequat dolor incididunt elit sit laborum.',
      imageUrl: 'assets/imgs/1.png'),
  SliderInfo(
      title: 'Entraga rapida',
      caption:
          'Ut cupidatat id non deserunt ex laborum. Velit non enim adipisicing irure. Laboris enim nostrud ut enim reprehenderit tempor velit. Pariatur eu do eiusmod fugiat ex sunt. Velit culpa commodo sit deserunt commodo esse amet eiusmod cupidatat ipsum qui. Sit est minim veniam laborum magna non.',
      imageUrl: 'assets/imgs/2.png'),
  SliderInfo(
      title: 'Difruta la comida',
      caption:
          'Ut tempor quis aliquip enim. Aute anim ut qui velit quis. Consectetur nulla exercitation eu dolore laborum laborum aliquip cillum excepteur. Nulla sunt esse ex aliquip elit adipisicing sint quis adipisicing in.',
      imageUrl: 'assets/imgs/3.png'),
];
