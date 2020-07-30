import 'package:flutter/material.dart';
import 'package:flutter_components/src/models/movie_model.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesCarousel extends StatelessWidget {

  final List<Movie> movies;
  MoviesCarousel({@required this.movies});

  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3
        ),
        children: _cards(context)
      ),
    );
  }

  List<Widget>_cards(context) {

    return movies.map((movie) {
      return Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.getPosterImg()),
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
            SizedBox(height: 5),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.abel(
                fontSize: 15,
                textStyle: Theme.of(context).textTheme.caption
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}