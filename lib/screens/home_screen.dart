import 'package:flutter/material.dart';
import 'package:movies/provider/movie_provider.dart';
import 'package:movies/screens/fav_movies.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    //context.watch  from the 'provider package' to access the 'movies' property of the MovieProvider
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Cart using Provider'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //the liked movies button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              //redirecting to a new page with list of liked mvoies
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyListScreenState(),
                ));
              },

              icon: Icon(Icons.favorite),
              label: Text(
                "Go to my List (${myList.length})",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 20)),
            ),
          ),

          //th elist of movies from provider
          Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (_, index) {
                    final currentMovie = movies[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: Card(
                        key: ValueKey(currentMovie.title),
                        color: Colors.blue,
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            currentMovie.title,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          subtitle: Text(
                            currentMovie.duration ?? 'No information',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: myList.contains(currentMovie)
                                  ? Colors.red
                                  : Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              if (!myList.contains(currentMovie)) {
                                context
                                    .read<MovieProvider>()
                                    .addToList(currentMovie);
                              } else {
                                context
                                    .read<MovieProvider>()
                                    .removeFromList(currentMovie);
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
