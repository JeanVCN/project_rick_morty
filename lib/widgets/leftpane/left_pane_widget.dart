import 'package:flutter/material.dart';
import 'package:movie_catalogue/widgets/leftpane/main_nav_item.dart';

class LeftPane extends StatelessWidget {
  final int selected;
  final Function mainNavAction;

  const LeftPane(
      {Key? key, required this.selected, required this.mainNavAction})
      : super(key: key);

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
                selected == 2,
                () => mainNavAction(
                      2,
                    )),
            MainNavItem(
                "Locais",
                Icons.verified_outlined,
                selected == 3,
                () => mainNavAction(
                      3,
                    )),
            MainNavItem(
                "Episódios",
                Icons.verified_outlined,
                selected == 4,
                () => mainNavAction(
                      4,
                    )),
          ],
        )),
      ],
    );
  }
}
