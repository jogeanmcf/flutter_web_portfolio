import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        h2('Projetos front/back end'),
        CustomListTile(title: 'Tetris Game', subtitle: '''
Desenvolvi o jogo Tetris no framework flutter, com uma interfase moderda, responsivo e opções de light/dark mode.
'''),
        CustomListTile(title: 'RXiv', subtitle: '''
A plataforma arxiv é um repositório de artigos pre-print. Desenvolvi uma aplicação mobile que consome uma API externa e permite buscas no repositório.
'''),
        CustomListTile(title: 'YT Muic Clone', subtitle: '''
Reproduzi a UI do youtube music usando Flutter e consumindo a api do youtube usando back-end em python.
'''),
        CustomListTile(title: 'Feedback Widget', subtitle: '''
Projeto de um dos cursos da Rocketseat. A proposta é um widget feito em React que serve como ferramenta de feedback.
'''),
        CustomListTile(title: 'Hamburger Website', subtitle: '''
Um protótipo de e-comerce voltado ao mercado de hamburgerias, com todas as funcionalidades de navegaçaõ, login, compra.
'''),
        h2('Artigos e Livros Publicados'),
        CustomListTile(
            title:
                'Gauge Miura and Bäcklund transformations for generalized An-KdV hierarchies',
            subtitle: ''),
        CustomListTile(
            title:
                'Generalized Backlund transformations for Affine Toda Hierarchies',
            subtitle: '')
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
// final String ;

  const CustomListTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: InkWell(child: Text(title)),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class h2 extends StatelessWidget {
  final String text;
  const h2(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ));
  }
}
