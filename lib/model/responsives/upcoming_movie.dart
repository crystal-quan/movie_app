
import 'package:json_annotation/json_annotation.dart';
part 'upcoming_movie.g.dart';
@JsonSerializable()
class Upcoming {
  List<Result>? results;

  Upcoming({this.results});
  factory Upcoming.fromJson(Map<String, dynamic> json) => _$UpcomingFromJson(json);
}

@JsonSerializable()
class Result {
  int? id;
  @JsonKey(name: "poster_path") // thuộc tính của Jsonkey để gán name vào string của biến string ngay dưới nó
  String? posterPath;
  
  
  Result({this.id, this.posterPath});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}


