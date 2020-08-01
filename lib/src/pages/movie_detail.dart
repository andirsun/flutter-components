
import 'package:flutter/material.dart';
import 'package:flutter_components/src/models/actor_model.dart';

import 'package:flutter_components/src/models/movie_model.dart';
import 'package:flutter_components/src/providers/movies_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetail extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // Recieve movie from params arguments
    final Movie movie = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _createAppbar(context,movie),
          SliverList(
            delegate : SliverChildListDelegate(
              [
                SizedBox(height: 10),
                _titlePoster(context,movie),
                _description(movie),
                _createCasting(movie),
                
              ]
            )
          )
        ],
      ),
    );
  }

  Widget _createAppbar(context,Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: GoogleFonts.righteous(
            color: Colors.white,
            textStyle: Theme.of(context).textTheme.subtitle1
          ),
          overflow: TextOverflow.ellipsis,
        ),
        background: FadeInImage(
          image: NetworkImage(movie.getBackgroundImg()),
          placeholder: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _titlePoster(BuildContext context,Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Hero(
            tag: movie.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image:NetworkImage(movie.getPosterImg()),
                height: 150,
              ),
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: GoogleFonts.abel(
                    textStyle: Theme.of(context).textTheme.headline5
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movie.originalTitle,
                  style: GoogleFonts.abel(
                    textStyle: Theme.of(context).textTheme.subtitle1
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(
                      movie.voteAverage.toString(),
                      style: GoogleFonts.abel(
                        textStyle: Theme.of(context).textTheme.subtitle1
                      ),
                    )
                  ],
                )
              ],
            ) 
          )
        ],
      ),
    );
  }

  Widget _description(Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  _createCasting(Movie movie) {
    final movieProvider = new MoviesProvider();
    
    return FutureBuilder(
      future: movieProvider.getCast(movie.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
        if(snapshot.hasData){
          return _createActorsPageView(snapshot.data);
        }else{
          return Container(
            alignment: Alignment.center,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _createActorsPageView(List<Actor> actors) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.25,
          initialPage: 1,
        ),
        itemCount: actors.length,
        itemBuilder: (context,i)=> _actorCard(actors[i])

      ),
    );
  }

  Widget _actorCard(Actor actor){
    return Container(
      
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.getProfileImage()),
              fit : BoxFit.cover,
              height: 150,
            ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}