import 'package:injectable/injectable.dart';

import '../../core/network/models/response/movieDetails/remote_Movie_DM.dart';
import '../../domain/models/movieDetails_model.dart';





@injectable
class MovieMapper {
  MovieDetailsModel toMovieDetails(RemoteMovieDM remoteMovieDt) {
    return MovieDetailsModel(

      url: remoteMovieDt.url,
      title:remoteMovieDt.title,
   rating: remoteMovieDt.rating?.toDouble(),
      id: remoteMovieDt.id?.toString(),
     year: remoteMovieDt.year?.toInt(),
      genres: remoteMovieDt.genres??[],
      titleEnglish: remoteMovieDt.titleEnglish??'',
      backgroundImage: remoteMovieDt.backgroundImage??"",
      cast: remoteMovieDt.cast??[],
      backgroundImageOriginal: remoteMovieDt.backgroundImage,
      dateUploaded: remoteMovieDt.dateUploaded,
      likeCount:remoteMovieDt.likeCount?.toInt()??0,
      smallCoverImage: remoteMovieDt.smallCoverImage,
      largeCoverImage:remoteMovieDt.largeCoverImage,
      mediumCoverImage:remoteMovieDt.mediumCoverImage,
      largeScreenshotImage1: remoteMovieDt.largeScreenshotImage1,
      mediumScreenshotImage1: remoteMovieDt.mediumScreenshotImage1,
      largeScreenshotImage2: remoteMovieDt.largeScreenshotImage2,
      largeScreenshotImage3: remoteMovieDt.largeScreenshotImage3,
      mediumScreenshotImage2: remoteMovieDt.mediumScreenshotImage2,
      mediumScreenshotImage3: remoteMovieDt.mediumScreenshotImage3,
      runtime: remoteMovieDt.runtime?.toInt()??0,
      language: remoteMovieDt.language,
        descriptionIntro: remoteMovieDt.descriptionIntro??"",
      descriptionFull: remoteMovieDt.descriptionFull







    );




  }

  List<MovieDetailsModel> toMovies(List<RemoteMovieDM> movies) {
    if (movies == null) return [];
    return movies.map(toMovieDetails).toList();
  }
}
