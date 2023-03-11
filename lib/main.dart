import 'package:flutter/material.dart';
import 'package:movie_catalogue/layout_character.dart';
import 'package:movie_catalogue/layout_location.dart';

void main() {
  runApp(const ProjectRickMorty());
}

class ProjectRickMorty extends StatelessWidget {
  const ProjectRickMorty({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick And Morty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: LayoutLocation(),
      ),
    );
  }
}
