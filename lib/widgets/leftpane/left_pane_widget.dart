import 'package:flutter/material.dart';

class LeftPane extends StatelessWidget {
  const LeftPane({
    Key? key,
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
      ],
    );
  }
}
