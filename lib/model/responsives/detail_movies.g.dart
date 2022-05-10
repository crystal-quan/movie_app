// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailMovies _$DetailMoviesFromJson(Map<String, dynamic> json) => DetailMovies(
      backdropPath: json['backdrop_path'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      overview: json['overview'] as String?,
      voteAverage: json['voteAverage'] as num?,
    );


Genres _$GenresFromJson(Map<String, dynamic> json) => Genres(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

