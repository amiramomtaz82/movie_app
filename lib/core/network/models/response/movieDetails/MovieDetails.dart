import 'package:movie_app/core/network/models/response/movieDetails/remote_Movie_DM.dart';

import '../list_movie_response/meta_model.dart';

/// status : "ok"
/// status_message : "Query was successful"
/// data : {"movie":{"id":15,"url":"https://yts.bz/movies/16-blocks-2006","imdb_code":"tt0450232","title":"16 Blocks","title_english":"16 Blocks","title_long":"16 Blocks (2006)","slug":"16-blocks-2006","year":2006,"rating":6.6,"runtime":102,"genres":["Action","Crime","Drama","Thriller"],"like_count":55,"description_intro":"An aging alcoholic cop is assigned the task of escorting a witness from police custody to a courthouse 16 blocks away. There are, however, chaotic forces at work that prevent them from making it in one piece.","description_full":"An aging alcoholic cop is assigned the task of escorting a witness from police custody to a courthouse 16 blocks away. There are, however, chaotic forces at work that prevent them from making it in one piece.","yt_trailer_code":"55nKvGV0APA","language":"en","mpa_rating":"PG-13","background_image":"https://yts.bz/assets/images/movies/16_Blocks_2006/background.jpg","background_image_original":"https://yts.bz/assets/images/movies/16_Blocks_2006/background.jpg","small_cover_image":"https://yts.bz/assets/images/movies/16_Blocks_2006/small-cover.jpg","medium_cover_image":"https://yts.bz/assets/images/movies/16_Blocks_2006/medium-cover.jpg","large_cover_image":"https://yts.bz/assets/images/movies/16_Blocks_2006/large-cover.jpg","medium_screenshot_image1":"https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg","large_screenshot_image2":"https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg","large_screenshot_image3":"https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg","cast":[{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Spencer Kayden","character_name":"Juror","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0443248.jpg","imdb_code":"0443248"},{"name":"Tig Fong","character_name":"Briggs","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0284609.jpg","imdb_code":"0284609"},{"name":"Alan Lee","character_name":"Subway Commuter / Pedestrian","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm2265907.jpg","imdb_code":"2265907"}],"torrents":[{"url":"https://yts.bz/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":4,"peers":0,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.bz/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":25,"peers":0,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}],"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855}}
/// @meta : {"api_version":2,"execution_time":"0 ms"}

class MovieDetails {
  MovieDetails({
      this.status, 
      this.statusMessage, 
      this.data, 
      this.meta,});

  MovieDetails.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ?Meta.fromJson(json['@meta']) : null;
  }
  String? status;
  String? statusMessage;
  Data? data;
 Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (meta != null) {
      map['@meta'] = meta?.toJson();
    }
    return map;
  }

}

/// api_version : 2
/// execution_time : "0 ms"


/// movie : {"id":15,"url":"https://yts.bz/movies/16-blocks-2006","imdb_code":"tt0450232","title":"16 Blocks","title_english":"16 Blocks","title_long":"16 Blocks (2006)","slug":"16-blocks-2006","year":2006,"rating":6.6,"runtime":102,"genres":["Action","Crime","Drama","Thriller"],"like_count":55,"description_intro":"An aging alcoholic cop is assigned the task of escorting a witness from police custody to a courthouse 16 blocks away. There are, however, chaotic forces at work that prevent them from making it in one piece.","description_full":"An aging alcoholic cop is assigned the task of escorting a witness from police custody to a courthouse 16 blocks away. There are, however, chaotic forces at work that prevent them from making it in one piece.","yt_trailer_code":"55nKvGV0APA","language":"en","mpa_rating":"PG-13","background_image":"https://yts.bz/assets/images/movies/16_Blocks_2006/background.jpg","background_image_original":"https://yts.bz/assets/images/movies/16_Blocks_2006/background.jpg","small_cover_image":"https://yts.bz/assets/images/movies/16_Blocks_2006/small-cover.jpg","medium_cover_image":"https://yts.bz/assets/images/movies/16_Blocks_2006/medium-cover.jpg","large_cover_image":"https://yts.bz/assets/images/movies/16_Blocks_2006/large-cover.jpg","medium_screenshot_image1":"https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg","large_screenshot_image2":"https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg","large_screenshot_image3":"https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg","cast":[{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Spencer Kayden","character_name":"Juror","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0443248.jpg","imdb_code":"0443248"},{"name":"Tig Fong","character_name":"Briggs","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0284609.jpg","imdb_code":"0284609"},{"name":"Alan Lee","character_name":"Subway Commuter / Pedestrian","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm2265907.jpg","imdb_code":"2265907"}],"torrents":[{"url":"https://yts.bz/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":4,"peers":0,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.bz/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":25,"peers":0,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}],"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855}

class Data {
  Data({
      this.movie,});

  Data.fromJson(dynamic json) {
    movie = json['movie'] != null ? RemoteMovieDM.fromJson(json['movie']) : null;
  }
  RemoteMovieDM? movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movie != null) {
      map['movie'] = movie?.toJson();
    }
    return map;
  }

}

/// id : 15
/// url : "https://yts.bz/movies/16-blocks-2006"
/// imdb_code : "tt0450232"
/// title : "16 Blocks"
/// title_english : "16 Blocks"
/// title_long : "16 Blocks (2006)"
/// slug : "16-blocks-2006"
/// year : 2006
/// rating : 6.6
/// runtime : 102
/// genres : ["Action","Crime","Drama","Thriller"]
/// like_count : 55
/// description_intro : "An aging alcoholic cop is assigned the task of escorting a witness from police custody to a courthouse 16 blocks away. There are, however, chaotic forces at work that prevent them from making it in one piece."
/// description_full : "An aging alcoholic cop is assigned the task of escorting a witness from police custody to a courthouse 16 blocks away. There are, however, chaotic forces at work that prevent them from making it in one piece."
/// yt_trailer_code : "55nKvGV0APA"
/// language : "en"
/// mpa_rating : "PG-13"
/// background_image : "https://yts.bz/assets/images/movies/16_Blocks_2006/background.jpg"
/// background_image_original : "https://yts.bz/assets/images/movies/16_Blocks_2006/background.jpg"
/// small_cover_image : "https://yts.bz/assets/images/movies/16_Blocks_2006/small-cover.jpg"
/// medium_cover_image : "https://yts.bz/assets/images/movies/16_Blocks_2006/medium-cover.jpg"
/// large_cover_image : "https://yts.bz/assets/images/movies/16_Blocks_2006/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg"
/// cast : [{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Spencer Kayden","character_name":"Juror","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0443248.jpg","imdb_code":"0443248"},{"name":"Tig Fong","character_name":"Briggs","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0284609.jpg","imdb_code":"0284609"},{"name":"Alan Lee","character_name":"Subway Commuter / Pedestrian","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm2265907.jpg","imdb_code":"2265907"}]
/// torrents : [{"url":"https://yts.bz/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":4,"peers":0,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.bz/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":25,"peers":0,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}]
/// date_uploaded : "2015-10-31 20:47:35"
/// date_uploaded_unix : 1446320855


/// url : "https://yts.bz/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2"
/// hash : "8619B57A3F39F1B49A1A698EA5400A883928C0A2"
/// quality : "720p"
/// type : "bluray"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "2.0"
/// seeds : 4
/// peers : 0
/// size : "702.04 MB"
/// size_bytes : 736142295
/// date_uploaded : "2015-10-31 20:47:35"
/// date_uploaded_unix : 1446320855

class Torrents {
  Torrents({
      this.url, 
      this.hash, 
      this.quality, 
      this.type, 
      this.isRepack, 
      this.videoCodec, 
      this.bitDepth, 
      this.audioChannels, 
      this.seeds, 
      this.peers, 
      this.size, 
      this.sizeBytes, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Torrents.fromJson(dynamic json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  num? seeds;
  num? peers;
  String? size;
  num? sizeBytes;
  String? dateUploaded;
  num? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['hash'] = hash;
    map['quality'] = quality;
    map['type'] = type;
    map['is_repack'] = isRepack;
    map['video_codec'] = videoCodec;
    map['bit_depth'] = bitDepth;
    map['audio_channels'] = audioChannels;
    map['seeds'] = seeds;
    map['peers'] = peers;
    map['size'] = size;
    map['size_bytes'] = sizeBytes;
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}

/// name : "Bruce Willis"
/// character_name : "Det. Jack Mosley"
/// url_small_image : "https://yts.bz/assets/images/actors/thumb/nm0000246.jpg"
/// imdb_code : "0000246"

class Cast {
  Cast({
      this.name, 
      this.characterName, 
      this.urlSmallImage, 
      this.imdbCode,});

  Cast.fromJson(dynamic json) {
    name = json['name'];
    characterName = json['character_name'];
    urlSmallImage = json['url_small_image'];
    imdbCode = json['imdb_code'];
  }
  String? name;
  String? characterName;
  String? urlSmallImage;
  String? imdbCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['character_name'] = characterName;
    map['url_small_image'] = urlSmallImage;
    map['imdb_code'] = imdbCode;
    return map;
  }

}