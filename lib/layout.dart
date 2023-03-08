import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_catalogue/api.dart';
import 'package:movie_catalogue/widgets/main_pane.dart';
import 'package:movie_catalogue/widgets/subheader/sub_header.dart';
import 'package:movie_catalogue/widgets/leftpane/left_pane_widget.dart';
import 'package:movie_catalogue/widgets/mainheader/main_header.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppLayoutState();
  }
}

class _AppLayoutState extends State<AppLayout> {
  List<Results> data = List<Results>.empty(); // Lista dos filmes
  String search = "Morty"; // Plavra chave da pesquisa

  // Construtor, atualiza com setState a lista de filmes.
  _AppLayoutState() {
    API.getMovie(search).then((response) {
      setState(() {
        final body = json.decode(response.body)
            as Map<String, dynamic>; // Usamos um iterator
        final results = body["results"] as List<dynamic>;
        data = results
            .map((e) => Results(e["id"], e["name"], e["species"], e["image"]))
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
                mainNavAction: menuAction,
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
                  // Sub header with sort and filter
                  Container(
                    height: 120,
                    color: Colors.deepPurple.withOpacity(0.60),
                    child: SubHeader(),
                  ),
                  //Main Pane
                  Expanded(
                    child: Center(
                        child: MainPane(
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

  void menuAction(int page, List<Results> data) {
    setState(() {
      _currentPage = page;
      this.data = data;
    });
  }
}
