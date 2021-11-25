import 'package:filmy/views/edit_movie/view.dart';
import 'package:filmy/views/hive/hive_adapter.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final Movies movie;

  const MovieTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: TextButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => EditMovie(),
          //   ),
          // );
        },
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
        ),
        child: Container(
          height: 112.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 100.0,
                  child: Image.memory(
                    movie.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    movie.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    movie.directorName,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
