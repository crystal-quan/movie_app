import 'package:json_annotation/json_annotation.dart';

part 'popular_movie.g.dart';

@JsonSerializable()
class Popular {
  List<Result>? results;

  Popular({this.results});
  factory Popular.fromJson(Map<String, dynamic> json) => _$PopularFromJson(json);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "backdrop_path") // thuộc tính của Jsonkey để gán name vào string của biến string ngay dưới nó
  String? backdropPath;
  int? id;
  String? title;

  @JsonKey(name: "vote_average")
  num? voteAverage;

  Result({this.backdropPath, this.id, this.title, this.voteAverage});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
