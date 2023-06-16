import 'package:flutter/material.dart';

import '../../../utils/movieList.dart';

class MovieRecommandation extends StatefulWidget {
  const MovieRecommandation({super.key});

  @override
  State<StatefulWidget> createState() => MovieRecommandationState();
}

class MovieRecommandationState extends State<MovieRecommandation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Recommandation'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: MovieList.moviesList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.movie,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(
                  '${MovieList.moviesList[index]['movieName']}',
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.movie_creation,
                              size: 100,
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: const Text(
                                        'Movie Name:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 8,
                                      child: Text(
                                          '${MovieList.moviesList[index]['movieName']}'))
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: const Text(
                                        'Movie Release Year:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 8,
                                      child: Text(
                                          '${MovieList.moviesList[index]['releaseYear']}'))
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: const Text(
                                        'Description:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 8,
                                      child: Text(
                                          '${MovieList.moviesList[index]['movieDescription']}'))
                                ],
                              ),
                            )
                          ],
                        );
                      });
                },
              );
            }),
      ),
    );
  }
}
