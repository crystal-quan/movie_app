// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/load_status.dart';
import 'package:movie_app/model/responsives/popular_movie.dart';
import 'package:movie_app/model/responsives/upcoming_movie.dart';
import 'package:movie_app/repositories/moive_repo.dart';

part 'home_page_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieRepository moiveRepository;
  MovieCubit(this.moiveRepository) : super(MovieState());

  void init() async {
    emit(state.copyWith(loadStatus: LoadStatus.LOADING));
    try {
      final apiPopular = await moiveRepository.getPopularMovies();
      final apiUpcoming = await moiveRepository.getUpcomingMovies();
      if (apiPopular != null) {
        emit(state.copyWith(
            popular: apiPopular,
            upcoming: apiUpcoming,
            loadStatus: LoadStatus.SUCCESS));
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.FAILURE));
      }
    } catch (e) {
      print("QuanBM - Error : $e");
      emit(state.copyWith(loadStatus: LoadStatus.FAILURE));
    }
  }
}
