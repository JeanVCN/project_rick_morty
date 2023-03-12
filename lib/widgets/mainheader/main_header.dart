import 'package:flutter/material.dart';
import 'package:project_rick_morty/widgets/mainheader/search_bar.dart';

class MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SearchBar(),
      ],
    );
  }
}
