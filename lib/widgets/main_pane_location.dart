import 'package:flutter/material.dart';
import '../api.dart';

class MainPaneLocation extends StatelessWidget {
  final List<ResultsLocation> data;

  const MainPaneLocation({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 50,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 300,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome: " + data[index].name,
                      style: const TextStyle(
                          fontSize: 17, color: Color.fromARGB(255, 24, 23, 23)),
                    ),
                    Text(
                      "Tipo: " + data[index].type,
                      style: const TextStyle(
                          fontSize: 17, color: Color.fromARGB(255, 24, 23, 23)),
                    ),
                    Text(
                      "Dimensão : " + data[index].dimension,
                      style: const TextStyle(
                          fontSize: 17, color: Color.fromARGB(255, 24, 23, 23)),
                    ),
                    Text(
                      "Data de criação: " + data[index].created,
                      style: const TextStyle(
                          fontSize: 17, color: Color.fromARGB(255, 24, 23, 23)),
                    ),
                  ],
                )),
          ]);
        });
  }
}
