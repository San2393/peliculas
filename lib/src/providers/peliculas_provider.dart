import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apiKey = '32ff0013848e464b2d3c09eade4c9f8a';
  String _url = 'api.themoviedb.org';
  String _lenguaje = 'es-Es';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'languahe': _lenguaje,
    });

    final respuesta = await http.get(url);
    final decodedData = json.decode(respuesta.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }
}
