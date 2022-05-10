import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/cubit/detail_movies_cubit.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({Key? key}) : super(key: key);

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  final DetailMoviesCubit _cubit;
  @override
  void initState() {
    _cubit = BlocProvider.of<DetailMoviesCubit>(context);
    super.initState();
    _cubit.init();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: BlocBuilder<DetailMoviesCubit, DetailMoviesState>(
            buildWhen: (previous, current) =>
                previous.loadStatus != current.loadStatus,
            builder: (context, state) {
              return Container (
                child: SizedBox(),
              );
            },
          ),
        )
      ],
    );
  }
}
