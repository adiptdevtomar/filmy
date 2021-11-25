import 'package:filmy/views/core_widgets/avatar.dart';
import 'package:filmy/views/edit_movie/view.dart';
import 'package:filmy/views/helper.dart';
import 'package:filmy/views/hive/hive_adapter.dart';
import 'package:filmy/views/home_view/widgets/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'controller.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(_vsProvider);
    final controller = watch(_vsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            child: RoundAvatar(avatarUrl: '', placeholderString: 'd'),
            padding: EdgeInsets.only(right: 10.0),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            SizedBox(
              height: 50.0,
              child: Center(
                child: TextField(
                  cursorColor: Colors.white,
                  onChanged: controller.onSearchTextChanged,
                  decoration: textFieldDecoration.copyWith(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box<Movies>(Names.hiveBox).listenable(),
                builder: (context, Box<Movies> box, _) {
                  final movies = box.values;
                  if (movies.isEmpty) {
                    return Center(
                      child: Text('No Movie'),
                    );
                  } else {
                    return AnimationLimiter(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: movies.length,
                        itemBuilder: (BuildContext context, int index) {
                          final movie = box.getAt(index);
                          if (movie!.name.contains(state.searchText)) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: MovieTile(
                                    movie: movie,
                                  ),
                                ),
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditMovie()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
