import 'package:flutter/material.dart';
import 'package:flutter_components/src/models/movie_model.dart';
import 'package:flutter_components/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate {
  
  String selection;

  final moviesProvider = new MoviesProvider();
  
  final movies = [
    'Superman',
    'Hombre Araña',
    'Hulk',
    'Avengers',
    'Aaron'
  ];
  
  final recentMovies =[
    'Superman',
    'Hombre Araña'
  ];
  
  
  @override
  List<Widget> buildActions(BuildContext context) {
    // Appbar actions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // delete the query string
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icon in the start of app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Results of search
    return Center(
      child : Container(
        height: 100,
        width: 100,
        color : Colors.blueAccent,
        child: Text(selection),
      )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // QUery suggestions
    if(query.isEmpty) {
      return Container();
    } else { 
      return FutureBuilder(
        future: moviesProvider.searchMovie(query),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          
          final movies = snapshot.data;
          
          if(snapshot.hasData) { 
            return ListView(
              children: movies.map((movie) {
                //Hero unique tag
                movie.uniqueId = '${movie.id}-poster';
                return ListTile(
                  leading: Hero(
                    tag: movie.uniqueId,
                    child: FadeInImage(
                      placeholder:AssetImage('assets/no-image.jpg') ,
                      image: NetworkImage(movie.getPosterImg()),
                      width: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(movie.title),
                  subtitle: Text(movie.originalTitle),
                  onTap: () {
                    // close page search
                    //close(context, null);
                    //Navigate to movide detail Page
                    Navigator.pushNamed(context, 'movieDetail',arguments: movie);
                  },
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }


  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // QUery suggestions
  //   // Query pipe to filter the movie titles
  //   final searchQuery = (query.isEmpty ) 
  //                       ? recentMovies
  //                       : movies.where((element) => element.toLowerCase().startsWith(query.toLowerCase())
  //                       ).toList();


  //   return ListView.builder(
  //     itemCount: searchQuery.length,
  //     itemBuilder: (context,i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(searchQuery[i]),
  //         onTap: (){
  //           selection = searchQuery[i];
  //           showResults(context);
  //         },
  //       );
  //     }
  //   );
  // }

}