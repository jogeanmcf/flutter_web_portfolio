import 'dart:ui';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_web_portfolio/widgets/certificates.dart';
import 'package:unicons/unicons.dart';

import '../widgets/about_me.dart';
import '../widgets/projects.dart';
import '../widgets/skills.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   //TODO: mudar isso e ajustar de acrto com a usabilidade flutterWeb + (possivelmente) usando GoRouter
        //   // automaticallyImplyLeading: false
        // ),
        body: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.only(top: 24),
          color: Colors.grey[200],
          width: 360,
          child: const LeftSideColumn(),
        ),
        const Expanded(child: MainBody())
      ],
    ));
  }
}

class LeftSideColumn extends StatelessWidget {
  const LeftSideColumn({
    Key? key,
  }) : super(key: key);

  void copyData() {}
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      // focusNode: FocusNode(),
      // selectionControls: null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Hero(
            tag: 'main_content',
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/main_foto.jpg'),
              radius: 100,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: 'Jogean',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: ' Carvalho',
                  style: TextStyle(fontSize: 20, color: Colors.blue))
            ])),
          ),
          const Text(
            'Físico | Cientista de Dados | Desenvolvedor Front-End',
            textAlign: TextAlign.center,
          ),
          const Divider(),
          ListTile(
            leading: IconButton(icon: Icon(UniconsLine.at), onPressed: null),
            title: Text('jogeanmcf@gmail.com'),
            trailing: InkWell(
              child: Icon(Icons.copy),
              onTap: () {
                Clipboard.setData(ClipboardData(text: 'jogeanmcf@gmail.com'))
                    .then((value) =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Container(
                              child: Text('Email copiado'),
                            ))));
              },
            ),
          ),
          ListTile(
            leading: Icon(UniconsLine.phone),
            title: Text('+55 (61) 99325-4151'),
            trailing: InkWell(
              child: Icon(Icons.copy),
              onTap: () {
                Clipboard.setData(ClipboardData(text: '+55 (61) 99325-4151'))
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Telefone copiado')));
                });
              },
            ),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: Icon(
                    UniconsLine.linkedin,
                  ),
                  hoverColor: Colors.blue,
                  onPressed: () {
                    html.window.open(
                        "https://www.linkedin.com/in/jogeanmcf/", "_blank");
                  }),
              IconButton(
                  icon: Icon(UniconsLine.github),
                  hoverColor: Colors.blue,
                  onPressed: () {
                    html.window.open("https://github.com/jogeanmcf", "_blank");
                  }),
              IconButton(
                  icon: Icon(UniconsLine.twitter),
                  hoverColor: Colors.blue,
                  onPressed: () {
                    html.window.open("https://twitter.com/jogeanmcf", "_blank");
                  })
            ],
          )
        ],
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0, 1), blurRadius: 100)
            ]),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextButton(
                      child: Text(
                        'Sobre mim',
                        style: TextStyle(
                            // inherit: false,
                            color: tabController.index == 0
                                ? Colors.white
                                : Colors.blue),
                      ),
                      onPressed: () {
                        tabController.index = 0;
                        setState(() {});
                      },
                      style: TextButton.styleFrom(
                          minimumSize: Size(50, 80),
                          backgroundColor: tabController.index == 0
                              ? Colors.blue
                              : Colors.transparent)),
                ),
                Expanded(
                  child: TextButton(
                      child: Text(
                        'Projetos',
                        style: TextStyle(
                            // inherit: false,
                            color: tabController.index == 1
                                ? Colors.white
                                : Colors.blue),
                      ),
                      onPressed: () {
                        tabController.index = 1;
                        setState(() {});
                      },
                      style: TextButton.styleFrom(
                          minimumSize: Size(50, 80),
                          backgroundColor: tabController.index == 1
                              ? Colors.blue
                              : Colors.transparent)),
                ),
                Expanded(
                  child: TextButton(
                      child: Text(
                        'Certificados',
                        style: TextStyle(
                            // inherit: false,
                            color: tabController.index == 2
                                ? Colors.white
                                : Colors.blue),
                      ),
                      onPressed: () {
                        tabController.index = 2;
                        setState(() {});
                      },
                      style: TextButton.styleFrom(
                          minimumSize: Size(50, 80),
                          backgroundColor: tabController.index == 2
                              ? Colors.blue
                              : Colors.transparent)),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              // physics: ScrollAction(),
              children: [
                AboutMe(),
                Projects(),
                Certificates(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final onPressed;
  final Widget child;
  const MyButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    MyButtonStyle defaultStyle = Theme.of(context).extension();

    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class MyButtonStyle extends ThemeExtension<MyButtonStyle> {
  final Color? backgroundColor;
  final double? borderRadius;

  MyButtonStyle({required this.backgroundColor, required this.borderRadius});

  @override
  MyButtonStyle copyWith({Color? backgroundColor, double? borderRadius}) =>
      MyButtonStyle(
          backgroundColor: backgroundColor ?? this.backgroundColor,
          borderRadius: borderRadius ?? this.borderRadius);

  @override
  MyButtonStyle lerp(ThemeExtension<MyButtonStyle>? other, double t) {
    if (other is! MyButtonStyle) {
      return this;
    }

    return MyButtonStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
    );
  }
}
