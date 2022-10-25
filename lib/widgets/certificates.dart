import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_web_portfolio/widgets/projects.dart';

class Certificates extends StatelessWidget {
  const Certificates({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        h2('Cursos'),
        CustomListTile(
            title: 'Front-End Web Development with React',
            subtitle: 'Coursera'),
        CustomListTile(title: 'Data Science Orientation', subtitle: 'Coursera'),
        CustomListTile(
            title: 'Introduction to Front-End Development',
            subtitle: 'Cousera'),
        h2('Acadêmicos'),
        CustomListTile(title: 'Doutorado em Física', subtitle: 'IFT - Unesp'),
        CustomListTile(title: 'Mestrado em Física', subtitle: 'IFT - Unesp'),
        CustomListTile(title: 'Graduação em Física', subtitle: 'UnB')
      ],
    );
  }
}
