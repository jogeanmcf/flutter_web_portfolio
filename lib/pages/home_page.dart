import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/pages/big_screen/main_content.dart';
import 'package:flutter_web_portfolio/pages/layout_pages.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO: fazer um home page para páginas grandes e pequenas
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < 700) {
        return Scaffold(
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'home_page',
                    child: CircleAvatar(
                        radius: width / 6,
                        backgroundImage:
                            const AssetImage('assets/main_foto.jpg')),
                  ),
                  RichText(
                      softWrap: true,
                      text: TextSpan(
                          style: GoogleFonts.robotoMono(
                              color: Colors.black, fontSize: 24),
                          children: <TextSpan>[
                            TextSpan(
                                text: '''Olá!\n''',
                                style: TextStyle(fontSize: 32)),
                            TextSpan(text: '''Meu nome é\n'''),
                            TextSpan(
                                text: 'Jogean', style: TextStyle(fontSize: 32)),
                          ])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: TextButton(
                        onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LayoutPages()))
                            },
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            'Clique aqui para saber mais sobre mim',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        )),
                  )
                ],
              ),
            )
          ]),
        );
      }
      return Scaffold(
        body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'home_page',
                  child: CircleAvatar(
                      radius: width / 6,
                      backgroundImage:
                          const AssetImage('assets/main_foto.jpg')),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    softWrap: true,
                    text: TextSpan(
                        style: GoogleFonts.robotoMono(
                            color: Colors.black, fontSize: 24),
                        children: <TextSpan>[
                          TextSpan(
                              text: '''Olá!\n''',
                              style: TextStyle(fontSize: 32)),
                          TextSpan(text: '''Meu nome é\n'''),
                          TextSpan(
                              text: 'Jogean', style: TextStyle(fontSize: 32)),
                        ])),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: TextButton(
                      onPressed: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LayoutPages()))
                          },
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          'Clique aqui para saber mais sobre mim',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                      )),
                )
              ],
            ),
          )
        ]),
      );
    });
  }
}
