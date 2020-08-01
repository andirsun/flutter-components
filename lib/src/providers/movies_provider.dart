import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:flutter_components/src/models/actor_model.dart';
import 'package:flutter_components/src/models/movie_model.dart';

class MoviesProvider {
  String _apikey = '5fbe8dd45c488c62ec6e84d18c7a0d78';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularsPage = 0;
  bool fetchingData = false;

  List<Movie> _populars = new List();

  /* Begin of new movies stream */
  final _popularsStreamController = StreamController<List<Movie>>.broadcast();
  // Add Movies to the stream
  Function(List<Movie>) get popularsSink => _popularsStreamController.sink.add;
  // Listen the stream to get movies
  Stream<List<Movie>> get popularsStrem => _popularsStreamController.stream;
  void disposeStreams(){
    _popularsStreamController?.close();
  }
  /* End of new movies stream */

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
    // if the request is already in progress avoid make multiple requests
    if(fetchingData) return[];
    // begin the fetching data task
    fetchingData = true;
    // every time this function is call the query page will increase
    _popularsPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key' : _apikey,
      'language' :_language,
      'page' : _popularsPage.toString()
    });
    // Make request
    final resp =  await _processResponse(url);
    //Add new movies to the full movie list
    _populars.addAll(resp);
    // Adding the movies to the stream
    popularsSink(_populars);
    // end the fetching data task
    fetchingData = false;
    return resp; 
  }

  Future<List<Actor>>getCast(String movieId)async{
    final url = Uri.https(_url,'3/movie/$movieId/credits',{
      'api_key' : _apikey,
      'language' :_language,
    });

    final response = await http.get(url);

    final decodeData = json.decode(response.body);

    final cast = new Cast.fromJsonList(decodeData['cast']);

    return cast.actors;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key' : _apikey,
      'language' :_language,
      'query': query
    });
    return await _processResponse(url);
  }
}