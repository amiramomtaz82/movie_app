

import '../movieDetails/remote_Movie_DM.dart';
import 'MovieResponse.dart';

class Data {
  Data({
    this.movieCount,
    this.limit,
    this.pageNumber,
    this.movies,});

  Data.fromJson(dynamic json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(RemoteMovieDM.fromJson(v));
      });
    }
  }
  num? movieCount;
  num? limit;
  num? pageNumber;
  List<RemoteMovieDM>? movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    map['limit'] = limit;
    map['page_number'] = pageNumber;
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}