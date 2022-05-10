import 'package:json_annotation/json_annotation.dart';

part 'cast_movies.g.dart';

@JsonSerializable()
class CastMovies {
  @JsonKey(name: "profile_path")
  String? profilePath;
  String? name;
  String? character;
  
  CastMovies({this.profilePath, this.name, this.character});
  factory CastMovies.fromJson(Map<String, dynamic> json) =>
      _$CastMoviesFromJson(json);
}
