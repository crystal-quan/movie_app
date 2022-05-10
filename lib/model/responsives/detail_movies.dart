import 'package:json_annotation/json_annotation.dart';

part 'detail_movies.g.dart';

@JsonSerializable()
class DetailMovies {
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  String? overview;
  List<Genres>? genres;
  num? voteAverage;
  DetailMovies({this.backdropPath, this.genres, this.overview,this.voteAverage});
  factory DetailMovies.fromJson(Map<String, dynamic> json) =>
      _$DetailMoviesFromJson(json);
}

@JsonSerializable()
class Genres {
  int? id;
  String? name;
  Genres({this.id, this.name});
  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
}
