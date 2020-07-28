import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_components/src/models/movie_model.dart';

class MoviesProvider {
  String _apikey = '5fbe8dd45c488c62ec6e84d18c7a0d78';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Movie>> getInTheaters() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apikey,
      'language' :_language,
    });
    //Make the request
    final response = await http.get(url);
    // Decode data from body
    final decodedData = json.decode(response.body);
    // Parce to list
    final movies = new Movies.fromJsonList(decodedData['results']);
    //Return a movies list
    return movies.items;

  }

}