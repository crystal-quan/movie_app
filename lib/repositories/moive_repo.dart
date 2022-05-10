
import 'package:movie_app/model/responsives/cast_movies.dart';
import 'package:movie_app/model/responsives/detail_movies.dart';
import 'package:movie_app/model/responsives/popular_movie.dart';
import 'package:movie_app/model/responsives/upcoming_movie.dart';
import 'package:movie_app/network/api_client.dart';

abstract class MovieRepository {
  Future<Popular>? getPopularMovies();
  Future<Upcoming>? getUpcomingMovies();
  Future<DetailMovies>? getDetailMovies(String movieID);
  Future<CastMovies>? getCastMovies(String movieID);
}

class MovieRepositoryImpl extends MovieRepository {
  late ApiClient _apiClient;

  MovieRepositoryImpl(ApiClient client) {
    _apiClient = client;
  }

  @override
  Future<Popular>? getPopularMovies() async {
    return await _apiClient.getPopularMovies();
  }

  @override
  Future<Upcoming>? getUpcomingMovies() async {
    return await _apiClient.getUpcomingMovies();
  }

  @override
  Future<DetailMovies>? getDetailMovies(
    String movieID
  ) async {
    return await _apiClient.getDetailMovies(movieID);
  }

  @override
  Future<CastMovies>? getCastMovies(String movieID) async {
    return await _apiClient.getCastMovies(movieID);
  }
}
