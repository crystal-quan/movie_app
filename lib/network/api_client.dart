
import 'package:movie_app/model/responsives/detail_movies.dart';
import 'package:movie_app/model/responsives/popular_movie.dart';
import 'package:movie_app/model/responsives/upcoming_movie.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../model/responsives/cast_movies.dart';
part 'api_client.g.dart';

const apiKey = "26763d7bf2e94098192e629eb975dab0";

@RestApi(baseUrl: "https://api.themoviedb.org/3/movie")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/popular?api_key=$apiKey")
  Future<Popular> getPopularMovies();
  @GET("/upcoming?api_key=$apiKey")
  Future<Upcoming> getUpcomingMovies();
  @GET("/{movie_id}?api_key=$apiKey")
  Future<DetailMovies> getDetailMovies(@Path("movie_id") String movieID);
  @GET("/{movie_id}/credits?api_key=$apiKey")
  Future<CastMovies> getCastMovies(@Path("movie_id") String movieID);
}
