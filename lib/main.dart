import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/home_screen.dart';
import 'package:movie_app/repositories/moive_repo.dart';
import 'UI/bottom_bar_ui.dart';
import 'blocs/home_page_cubit.dart';
import 'network/api_client.dart';
import 'network/api_until.dart';

void main() {
  late final ApiClient _apiClient;
  _apiClient = ApiUtil.instance.apiClient;
  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MovieRepository>(create: (context) {
          return MovieRepositoryImpl(_apiClient);
        })
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MovieCubit>(create: (context) {
            final repository = RepositoryProvider.of<MovieRepository>(context);
            return MovieCubit(repository);
          }),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Stack(
            children: const [
              HomeScreen(),
              Align(
                child: BottomBar(),
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),
      )));
}
