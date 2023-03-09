import 'package:flutter/material.dart';
import 'package:project_rick_morty/widgets/leftpane/main_nav_item.dart';

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
                Icons.people_sharp,
                selected == 1,
                () => mainNavAction(
                      1,
                    )),
            MainNavItem(
                "Locais",
                Icons.location_city,
                selected == 2,
                () => mainNavAction(
                      2,
                    )),
            MainNavItem(
                "Episódios",
                Icons.movie,
                selected == 3,
                () => mainNavAction(
                      3,
                    )),
          ],
        )),
      ],
    );
  }
}
