part of 'home_page_cubit.dart';

// ignore: must_be_immutable
class MovieState extends Equatable {
  LoadStatus? loadStatus;
  Popular? popular;
  Upcoming? upcoming;

  MovieState({this.loadStatus, this.popular,this.upcoming});

  MovieState copyWith({
    LoadStatus? loadStatus,
    Popular? popular,
    Upcoming? upcoming,
  }) {
    return MovieState(
      loadStatus: loadStatus ?? this.loadStatus,
      popular: popular ?? this.popular,
      upcoming: upcoming ?? this.upcoming,
    );
  }

  @override
  List<Object?> get props => [loadStatus, popular,upcoming];
}
