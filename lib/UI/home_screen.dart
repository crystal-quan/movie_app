// ignore_for_file: unnecessary_const, deprecated_member_use, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:movie_app/blocs/home_page_cubit.dart';

//import 'detail_movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listimages = <String>[
    'assets/images/ic_genres.png',
    'assets/images/ic_tv.png',
    'assets/images/ic_roll.png',
    'assets/images/ic_cenima.png',
  ];
  List<String> listtexts = <String>[
    'Genres',
    'TV Series',
    'Movies',
    'In Theatre'
  ];
  late final MovieCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<MovieCubit>(context);
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    ///  bien size man hinh
    final multiwidth = MediaQuery.of(context).size.width;
    final multiheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: multiwidth,
        height: multiheight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff2B5876),
              Color(0xff4E4376),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  // margin: EdgeInsets.only(top: multiheight * 78 / 926),
                  width: multiwidth * 328 / 428,
                  height: multiheight * 40 / 926,
                  //color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Hello, ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffffffff)),
                          ),
                          Text(
                            'Name!',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                        ),
                        hoverColor: Colors.white,
                        height: 24,
                        minWidth: 24,
                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(107, 102, 166, 0.5),
                              Color.fromRGBO(117, 209, 221, 0.2)
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: multiwidth * 328 / 428,
                    height: multiheight * 50 / 926,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          flex: 4,
                          child: TextField(
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 0.5),
                              ),
                              labelText: 'Search',
                              icon: const Icon(Icons.search_outlined,
                                  color: Color.fromRGBO(255, 255, 255, 0.75)),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Row(
                              // ignore: duplicate_ignore
                              children: [
                                Container(
                                  width: 1,
                                  height: 30,
                                  // padding: EdgeInsets.symmetric(vertical : 5.0),
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.5),
                                ),
                                FlatButton(
                                  minWidth: 20,
                                  onPressed: () {
                                    ///
                                  },
                                  child: const Icon(
                                    Icons.mic_none,
                                    color: Color.fromRGBO(255, 255, 255, 0.5),
                                  ),
                                )
                              ],
                            ))
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.only(top: 26, bottom: 15),
                  width: multiwidth * 328 / 428,
                  child: const Text(
                    'Most Popular',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                BlocBuilder<MovieCubit, MovieState>(
                    buildWhen: (prev, current) =>
                        prev.loadStatus != current.loadStatus,
                    builder: (context, state) {
                      return SizedBox(
                        height: multiheight * 179 / 926,
                        width: multiwidth,
                        child: Swiper(
                            scale: .75, // no chinh ty le cac anh
                            viewportFraction:
                                .7, // nó chỉnh tầm nhin cua minh voi anh
                            autoplay: true,
                            pagination: const SwiperPagination(
                                margin:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                                builder: DotSwiperPaginationBuilder(
                                    color: Colors.white30,
                                    activeColor: Colors.white,
                                    size: 0.0,
                                    activeSize: 0.0)),
                            itemCount: state.popular?.results?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original${state.popular?.results?[index].backdropPath}",
                                  fit: BoxFit.fill,
                                  height: multiheight * (141 / 926),
                                  width: multiwidth * (328 / 428),
                                ),
                              );
                            }),
                      );
                    }),
                SizedBox(
                  height: multiheight * 20 / 926,
                ),
                SizedBox(
                  //alignment: Alignment.center,
                  //width: multiwidth * 328 / 428,
                  height: multiheight * 95 / 926,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    //padding: EdgeInsets.all(18),
                    itemCount: listimages.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int listindex) {
                      return Container(
                        width: multiwidth * 69 / 428,
                        height: multiheight * 95 / 926,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(166, 161, 224, 0.3),
                                Color.fromRGBO(161, 243, 254, 0.3)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 10,
                              height: 15,
                            ),
                            Image.asset(
                              listimages[listindex],
                              width: 34,
                              height: 34,
                            ),
                            const SizedBox(
                              width: 10,
                              height: 3,
                            ),
                            Text(
                              listtexts[listindex],
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: multiwidth * 18 / 428,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 26, bottom: 15),
                  width: multiwidth * 328 / 428,
                  child: const Text(
                    'Upcoming releases',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                BlocBuilder<MovieCubit, MovieState>(
                    bloc: _cubit,
                    buildWhen: (prev, current) =>
                        prev.loadStatus != current.loadStatus,
                    builder: (context, state) {
                      return SizedBox(
                        height: multiheight * 214 / 926,
                        width: multiwidth,
                        child: Swiper(
                          layout: SwiperLayout.DEFAULT,
                          autoplay: true,
                          scale: .7,
                          viewportFraction: 0.4,
                          itemWidth: multiwidth * 200 / 428,
                          itemCount: state.upcoming?.results?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/original/${state.upcoming?.results?[index].posterPath ?? ""}",
                                fit: BoxFit.fill,
                                //height: multiheight * (214 / 926),
                                //width: multiwidth * (145 / 428),
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
