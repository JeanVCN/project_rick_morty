import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_rick_morty/api.dart';
import 'package:project_rick_morty/widgets/main_pane_episode.dart';
import 'package:project_rick_morty/widgets/leftpane/left_pane_widget.dart';
import 'package:project_rick_morty/widgets/mainheader/main_header.dart';
import 'package:project_rick_morty/layout_character.dart';

class LayoutEpisode extends StatefulWidget {
  const LayoutEpisode({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LayoutEpisodeState();
  }
}

class _LayoutEpisodeState extends State<LayoutEpisode> {
  List<ResultsEpsiode> data = List<ResultsEpsiode>.empty(); // Lista dos filmes

  // Construtor, atualiza com setState a lista de filmes.
  _LayoutEpisodeState() {
    API.getEpisode().then((response) {
      setState(() {
        final body = json.decode(response.body)
            as Map<String, dynamic>; // Usamos um iterator
        final results = body["results"] as List<dynamic>;
        data = results
            .map((e) => ResultsEpsiode(
                e["name"], e["air_date"], e["episode"], e["created"]))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/bgEpisode.png"),
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
              child: LeftPane(),
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
