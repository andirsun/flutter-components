import 'package:flutter/material.dart';
import 'package:flutter_components/src/models/movie_model.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesCarousel extends StatelessWidget {

  final List<Movie> movies;
  final Function fetchNextData;
  MoviesCarousel({@required this.movies, @required this.fetchNextData});

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    // This method is trigged with a some conditions in the movies carousel
    _pageController.addListener(() {
      // if the page controller(carousel) is close to the list end
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        // fetch new movies data
        this.fetchNextData();
      }
    });
    /*
      Returns a container with a pageView carousel of movies
      that are created and rendered on demand to improve performance
    */
    return Container(
      height: _screenSize.height * 0.25,
      // pageview.builder is better in terms of performance vs pagebuilder
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (context, i){
          return this._createSingleCard(context, movies[i]);
        },
      ),
    );
  }
  /*
    This functions render the widget of a single card needed
  */
  Widget _createSingleCard(context, Movie movie){
    final movieCard = Container(
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
    return GestureDetector(
      child: movieCard,
      onTap: (){
        Navigator.pushNamed(context, 'movieDetail',arguments: movie);
      },
    );
  }
}