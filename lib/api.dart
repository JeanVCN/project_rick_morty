import 'package:http/http.dart' as http;

// A URL da API
const baseUrlCharacter =
    "https://rickandmortyapi.com/api/character/?name=Morty Smith";
const baseUrlLocation = "https://rickandmortyapi.com/api/location/";

// Criamos a classe da nossa API. O nome você que escolhe. Fazemos aqui
// uma requisição get (como fizemos no react) e passamos a URL, mas usamos
// um Uri.parse pra transformar a string em uma URI.
class API {
  static Future getCharacter() async {
    var url = baseUrlCharacter;
    return await http.get(Uri.parse(url));
  }

  static Future getLocation() async {
    var url = baseUrlLocation;
    return await http.get(Uri.parse(url));
  }
}

// Criamos uma classe para representar os objetos que vão conter os filmes
// e colocamos só os campos que vamos usar.

class ResultsCharacter {
  int id;
  String name;
  String species;
  String image;

  ResultsCharacter(this.id, this.name, this.species, this.image);
}

class ResultsLocation {
  String name;
  String type;
  String dimension;
  String created;

  ResultsLocation(this.name, this.type, this.dimension, this.created);
}
