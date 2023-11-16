import 'package:flutter/material.dart';
import 'package:movies/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class MyListScreenState extends StatefulWidget {
  const MyListScreenState({super.key});

  @override
  State<MyListScreenState> createState() => _MyListScreenStateState();
}

class _MyListScreenStateState extends State<MyListScreenState> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Fav List (${_myList.length})"),
      ),
      body: ListView.builder(
          itemCount: _myList.length,
          itemBuilder: (_, index) {
            final currentMovie = _myList[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 4,
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.duration ?? ''),
                trailing: TextButton(
                    onPressed: () {
                      context
                          .read<MovieProvider>()
                          .removeFromList(currentMovie);
                    },
                    child: const Text(
                      "Remove",
                      style: TextStyle(color: Colors.red),
                    )),
              ),
            );
          }),
    );
  }
}
