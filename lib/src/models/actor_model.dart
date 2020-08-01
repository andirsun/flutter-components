class Cast { 
  List<Actor> actors = new List();

  Cast.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null ) return;
    jsonList.forEach((item) {
      // Map every item in the response to a model
      final actor = Actor.fromJsonMap(item);
      // Add the actor model to list
      actors.add(actor);
    });
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String,dynamic> json){
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getProfileImage(){
    if(profilePath == null){
      return 'https://lh3.googleusercontent.com/proxy/MtiaNcV-FXTBWwA689qOtcAQpk0UwMLAagkHCSsRWlMalBBS4LsnJP_GJ_plBb6bzQl9_EP2yuruIRAwuYaDD3xcj2a6eYER10tsxjbaj4sNVOQhEzCps_mPTeRk';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
