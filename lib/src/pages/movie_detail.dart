import 'package:flutter/material.dart';
import 'package:flutter_components/src/models/movie_model.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetail extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // Recieve movie from params arguments
    final Movie movie = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _createAppbar(context,movie)
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
            //fontSize: 15,
            color: Colors.white,
            textStyle: Theme.of(context).textTheme.subtitle1
          ),
          
        ),
        background: FadeInImage(
          image: NetworkImage(movie.getBackgroundImg()),
          placeholder: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}