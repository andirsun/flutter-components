import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:flutter_components/src/models/movie_model.dart';

class MoviesProvider {
  String _apikey = '5fbe8dd45c488c62ec6e84d18c7a0d78';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularsPage = 0;

  List<Movie> _populars = new List();

  final _popularsStreamController = StreamController<List<Movie>>.broadcast();
  // Add Movies to the stream
  Function(List<Movie>) get popularsSink => _popularsStreamController.sink.add;
  // Listen the stream to get movies
  Stream<List<Movie>> get popularsStrem => _popularsStreamController.stream;
  void disposeStreams(){
    _popularsStreamController?.close();
  }

  Future<List<Movie>> _processResponse(Uri url) async {
    //Make the request
    final response = await http.get(url);
    // Decode data from body
    final decodedData = json.decode(response.body);
    // Parce to list
    final movies = new Movies.fromJsonList(decodedData['results']);
    //Return a movies list
    return movies.items;
  }
  
  Future<List<Movie>> getInTheaters() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apikey,
      'language' :_language,
    });
    return await _processResponse(url);
  }

  Future<List<Movie>> getPopulars() async {
    // every time this function is call the query page will increase
    _popularsPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key' : _apikey,
      'language' :_language,
      'page' : _popularsPage.toString()
    });

    final resp =  await _processResponse(url);

    _populars.addAll(resp);
    // Adding the movies to the stream
    popularsSink(_populars);
    
    return resp; 

  }

}