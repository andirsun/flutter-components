import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  
  String selection;
  
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
    // Query pipe to filter the movie titles
    final searchQuery = (query.isEmpty ) 
                        ? recentMovies
                        : movies.where((element) => element.toLowerCase().startsWith(query.toLowerCase())
                        ).toList();


    return ListView.builder(
      itemCount: searchQuery.length,
      itemBuilder: (context,i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(searchQuery[i]),
          onTap: (){
            selection = searchQuery[i];
            showResults(context);
          },
        );
      }
    );
  }

}