import 'package:flutter/material.dart';
import 'package:flutter_components/src/models/movie_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  
  //Properties 
  final List<Movie> movies ;
  
  //Constructor
  CardSwiper({
    //Reuired means that every time use this widget must provide the list of movies
    @required this.movies
  });

  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;
    
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Swiper(
        itemBuilder : (context,int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movies[index].getPosterImg()),
              fit: BoxFit.cover,
            ),
          );
        },
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemCount :movies.length,
        layout: SwiperLayout.STACK,
        // control : SwiperControl(),
        // pagination : SwiperPagination(),
      ),
    );
  }
}