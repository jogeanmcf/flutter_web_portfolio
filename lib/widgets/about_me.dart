import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Text('''
            Fzer um belo texto sobre mim
          '''),
            ImageGallery()
          ],
        ));
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
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
  ];
  int activedPage = 0;
  late PageController controller;
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 500,
      child: PageView.builder(
          controller: controller,
          itemCount: 2,
          pageSnapping: true,
          onPageChanged: (page) {
            setState(() {
              activedPage = page;
            });
          },
          itemBuilder: (context, pagePosition) {
            return Container(
              margin: EdgeInsets.all(40),
              child: Image.network(images[pagePosition]),
            );
          }),
    );
  }
}
