import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_catalogue/api.dart';
import 'package:movie_catalogue/widgets/main_pane_episode.dart';
import 'package:movie_catalogue/widgets/leftpane/left_pane_widget.dart';
import 'package:movie_catalogue/widgets/mainheader/main_header.dart';

class LayoutCharacter extends StatefulWidget {
  const LayoutCharacter({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LayoutCharacterState();
  }
}

class _LayoutCharacterState extends State<LayoutCharacter> {
  List<ResultsCharacter> data =
      List<ResultsCharacter>.empty(); // Lista dos filmes

  // Construtor, atualiza com setState a lista de filmes.
  _LayoutCharacterState() {
    API.getCharacter().then((response) {
      setState(() {
        final body = json.decode(response.body)
            as Map<String, dynamic>; // Usamos um iterator
        final results = body["results"] as List<dynamic>;
        data = results
            .map((e) =>
                ResultsCharacter(e["id"], e["name"], e["species"], e["image"]))
            .toList();
      });
    });
  }

  int _currentPage = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //left pane
            Container(
              width: 300,
              child: LeftPane(
                selected: _currentPage,
              ),
              color: const Color(0xFF253089).withOpacity(0.85),
            ),
            //
            Expanded(
              child: Column(
                children: [
                  //Main Header with search and profile
                  Container(
                    height: 120,
                    color: Colors.indigo.withOpacity(0.80),
                    child: MainHeader(),
                  ),

                  //Main Pane
                  Expanded(
                    child: Center(
                        child: MainPaneEpisode(
                      data: data,
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
