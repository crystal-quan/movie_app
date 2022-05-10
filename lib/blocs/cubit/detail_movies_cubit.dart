import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/load_status.dart';
import 'package:movie_app/model/responsives/detail_movies.dart';
import 'package:movie_app/repositories/moive_repo.dart';

import '../../model/responsives/cast_movies.dart';

part 'detail_movies_state.dart';

class DetailMoviesCubit extends Cubit<DetailMoviesState> {
  MovieRepository movieRepository;
  DetailMoviesCubit(this.movieRepository, this.movieID) : super(DetailMoviesState());
  String movieID;
  void init() async {
    emit(state.copywith(loadStatus: LoadStatus.LOADING));
    try{
      final apiDetail = await movieRepository.getDetailMovies(movieID);
      final apiCast = await movieRepository.getCastMovies(movieID); 
      if (apiDetail != null || apiCast != null) {
        emit(state.copywith(
            detailMovies: apiDetail,
            castMovies: apiCast,
            loadStatus: LoadStatus.SUCCESS));
      } else {
        emit(state.copywith(loadStatus: LoadStatus.FAILURE));
      }
    } catch (e) {
      // ignore: avoid_print
      print("find- error: $e");
      emit(state.copywith(loadStatus: LoadStatus.FAILURE));
    }
    }
  }

