import 'package:http/http.dart' as http;

// A URL da API
const baseUrlCharacter = "https://rickandmortyapi.com/api/character?name=";
const baseUrlLocation = "https://rickandmortyapi.com/api/character?name=";
const baseUrlEpisode = "https://rickandmortyapi.com/api/character?name=";

// Criamos a classe da nossa API. O nome você que escolhe. Fazemos aqui
// uma requisição get (como fizemos no react) e passamos a URL, mas usamos
// um Uri.parse pra transformar a string em uma URI.
class API {
  static Future getCharacter() async {
    var url = baseUrlCharacter;
    return await http.get(Uri.parse(url));
  }

  static Future getEpisode() async {
    var url = baseUrlEpisode;
    return await http.get(Uri.parse(url));
  }

  static Future getLocation() async {
    var url = baseUrlLocation;
    return await http.get(Uri.parse(url));
  }
}

// Criamos uma classe para representar os objetos que vão conter os filmes
// e colocamos só os campos que vamos usar.

class Results {
  int id;
  String name;
  String species;
  String image;

  Results(this.id, this.name, this.species, this.image);
}
