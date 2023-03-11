import 'package:flutter/material.dart';
import 'package:movie_catalogue/widgets/leftpane/main_nav_item.dart';
import 'package:movie_catalogue/layout_character.dart';

class LeftPane extends StatelessWidget {
  final int selected;

  const LeftPane({
    Key? key,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 185,
          width: 250,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white, width: 4)),
              image: DecorationImage(
                image: AssetImage("assets/img/logo.png"),
                fit: BoxFit.cover,
              )),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            MainNavItem(
                "Personagens",
                Icons.emoji_people_outlined,
                selected == 1,
                () => MaterialApp(
                      title: 'Rick And Morty',
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                      ),
                      home: const Scaffold(
                        body: LayoutCharacter(),
                      ),
                    )),
            MainNavItem(
                "Locais",
                Icons.verified_outlined,
                selected == 2,
                () => MaterialApp(
                      title: 'Rick And Morty',
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                      ),
                      home: const Scaffold(
                        body: LayoutCharacter(),
                      ),
                    )),
            MainNavItem(
                "Episódios",
                Icons.verified_outlined,
                selected == 3,
                () => MaterialApp(
                      title: 'Rick And Morty',
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                      ),
                      home: const Scaffold(
                        body: LayoutCharacter(),
                      ),
                    )),
          ],
        )),
      ],
    );
  }
}
