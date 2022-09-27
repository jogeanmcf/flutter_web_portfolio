import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/pages/main_content.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                    backgroundImage: const AssetImage('assets/main_foto.jpg')),
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
                            text: '''Olá!\n''', style: TextStyle(fontSize: 32)),
                        TextSpan(text: '''Meu nome é\n'''),
                        TextSpan(
                            text: 'Jogean', style: TextStyle(fontSize: 32)),
                      ])),
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: TextButton(
                    onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MainContent()))
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
}
