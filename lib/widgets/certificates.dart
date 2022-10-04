import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_web_portfolio/widgets/projects.dart';

class Certificates extends StatelessWidget {
  const Certificates({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: ListView(
        children: [
          h2('Cursos'),
          h2('Acadêmicos'),
        ],
      ),
    );
  }
}
