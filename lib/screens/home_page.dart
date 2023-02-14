import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/providers/movie_provider.dart';
import 'package:provider_basics/screens/fav_movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movie List",
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_){
                          return const FavoriteMovies();
                        }
                    )
                  );
                },
                icon: const Icon(Icons.favorite, color: Colors.white,),
                label: Text(
                  "Go to my list ${myList.length}",
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 20)
              ),
            ),

            const SizedBox(height: 18,),

            Expanded(
                child: ListView.builder(
                  itemCount: movies.length,
                    itemBuilder: (_, index) {
                    final currentMovies = movies[index];
                    return Card(
                      key: ValueKey(currentMovies.title),
                      color: Colors.blue,
                      elevation: 4.0,
                      child: ListTile(
                        title: Text(
                          currentMovies.title,
                          style: const TextStyle(
                            color: Colors.white
                          ),
                        ),
                        subtitle: Text(
                          currentMovies.duration ?? "No information",
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: (){
                            if(!myList.contains(currentMovies)){
                              context
                                  .read<MovieProvider>()
                                  .addMovie(currentMovies);
                            } else {
                              context
                                  .read<MovieProvider>()
                                  .removeMovie(currentMovies);
                            }
                          },
                          icon: Icon(
                              Icons.favorite,
                            size: 30,
                            color: myList.contains(currentMovies) ? Colors.cyanAccent : Colors.white,
                          ),
                        ),
                      ),
                    );
                    }
                ))
          ],
        ),
      ),
    );
  }
}
