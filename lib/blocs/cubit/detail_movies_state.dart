part of 'detail_movies_cubit.dart';

// ignore: must_be_immutable
class DetailMoviesState extends Equatable {
  LoadStatus? loadStatus;
  DetailMovies? detailMovies;
  CastMovies? castMovies;
  DetailMoviesState({this.loadStatus, this.detailMovies, this.castMovies});
  DetailMoviesState copywith ({
      LoadStatus? loadStatus,
      DetailMovies? detailMovies,
      CastMovies? castMovies,
  }) {
    return DetailMoviesState(
      loadStatus: loadStatus ?? this.loadStatus,
      detailMovies: detailMovies ?? this.detailMovies,
      castMovies: castMovies ?? this.castMovies
    );

    
  }
  
  @override
  List<Object?> get props => [loadStatus, detailMovies, castMovies];
}



