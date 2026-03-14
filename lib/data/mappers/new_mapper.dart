import 'package:injectable/injectable.dart';

import '../../core/network/models/response/movieDetails/MovieDetails.dart';
import '../../core/network/models/response/movieDetails/remote_Movie_DM.dart';
import '../../domain/models/movieDetails_model.dart';





@injectable
class NewMapper {
  MovieDetailsModel toMovieDetails(MovieDetails remoteMovieDt) {
    return MovieDetailsModel(

        id: remoteMovieDt.data?.movie?.id.toString()??"",

      mediumCoverImage: remoteMovieDt.data?.movie?.mediumCoverImage??"",

        rating: remoteMovieDt.data?.movie?.rating?.toDouble()??0.0,
      largeCoverImage: remoteMovieDt.data?.movie?.largeCoverImage??"",
        cast: remoteMovieDt.data?.movie?.cast??[]


    );




  }

  List<MovieDetailsModel> toMovies(List<MovieDetails> movies) {
    if (movies == null) return [];
    return movies.map(toMovieDetails).toList();
  }
}
