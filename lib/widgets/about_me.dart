import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_portfolio/widgets/projects.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        h2('Sobre mim'),
        Text('''
Eu sou Físico, Cientista de Dados, programador Front-End. Nos últimos anos dediquei em aprender as principais linguagens de programação. Apesar de eu ter um background mais acadêmico, minhas habilidades como pensamento analítico,
solução de problemas, raciocínio lógico matemático, pode ser bem empregado em áreas correlatas. Sou uma pessoa comunicativa, socializável e expressiva e com uma vontade insaciável de aprender. Uma palavra que me define é Curiosidade.
      '''
            .replaceAll('\n', '')),
        h2('Hobbies'),
        ListTile(leading: Text('・'), title: Text('Violão')),
        ListTile(leading: Text('・'), title: Text('Violino')),
        ListTile(
            leading: Text('・'),
            title: Text('Leituras: não ficção, ficção científica')),
        ListTile(leading: Text('・'), title: Text('DIY')),
        h2(''),
        // Center(child: ImageGallery())
      ],
    );
  }
}

// construir um carrosseu de imagens

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final List<String> images = [
    "fig-0.JPG",
    "fig-1.jpg",
    "fig-2.jpg"
    // "/assets/fig-1.jpg"
  ];
  int currentPage = 0;
  int _count = 0;
  late PageController controller;
  late Timer timer;
  @override
  void initState() {
    controller =
        PageController(viewportFraction: 0.8, initialPage: currentPage);
    timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      _count++;
      currentPage = _count % images.length;
      controller.animateToPage(currentPage,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      // print(currentPage);
      // setState(() {
      //   // controller.
      // });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 500,
      height: 300,
      child: PageView.builder(
          controller: controller,
          itemCount: images.length,
          pageSnapping: true,
          onPageChanged: (page) {
            setState(() {
              _count++;
              currentPage = _count % images.length;
            });
          },
          clipBehavior: Clip.antiAlias,
          itemBuilder: (context, pagePosition) {
            return Container(
              width: 300,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 10),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //           blurRadius: 1,
              //           spreadRadius: 1,
              //           color: Colors.grey.withOpacity(0.8),
              //           offset: Offset(-5, -5))
              //     ]),
              child: Image.asset(
                images[pagePosition],
                fit: BoxFit.fitWidth,
              ),
            );
          }),
    );
  }
}
