import 'package:flutter/material.dart';
import '../api.dart';

class MainPaneEpisode extends StatelessWidget {
  final List<ResultsCharacter> data;

  const MainPaneEpisode({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 50,
            mainAxisSpacing: 20,
            maxCrossAxisExtent: 300,
            childAspectRatio: 2.8 / 5),
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GridTile(
                  child: Image(
                    image: NetworkImage(data[index].image),
                    fit: BoxFit.fill,
                  ),
                  footer: Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.all(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 3),
                        color: Colors.yellowAccent,
                        child: Text(
                          "\u{2605} " + data[index].id.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index].name,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    Text(
                      data[index].species,
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white60),
                    ),
                  ],
                )),
          ]);
        });
  }
}
