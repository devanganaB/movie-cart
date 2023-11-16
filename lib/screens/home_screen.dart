import 'package:flutter/material.dart';
import 'package:movies/provider/movie_provider.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Cart using Provider'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
