import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> titles = <String>["Test1","Test2","Test3"];
  final List<String> covers = <String>["https://m.media-amazon.com/images/M/MV5BN2FjNmEyNWMtYzM0ZS00NjIyLTg5YzYtYThlMGVjNzE1OGViXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg",
  "https://m.media-amazon.com/images/M/MV5BMTkwNzExMjk0MF5BMl5BanBnXkFtZTcwOTUzNDcyMw@@._V1_.jpg","https://m.media-amazon.com/images/M/MV5BYjg1YTRkNzQtODgyYi00MTQ5LThiMDYtNDJjMWRjNTdjZDZlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Movies")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView.builder(
            itemCount: titles.length,
            itemBuilder: (BuildContext context, int index){
              final String title = titles[index];
              final String cover = covers[index];
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .8,
                          height: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(cover),
                                fit: BoxFit.cover
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 30.0,
                                    color: Colors.grey,
                                    offset: Offset(0, 70))
                              ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                          title,
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 40
                            )
                          ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Thriller",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 15
                          )
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 25
                                )
                              ),
                            ),
                          const SizedBox(width: 10),
                          Text(
                            title,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 25
                                )
                              ),
                            ),
                          const SizedBox(width: 10),
                          Text(
                              title,
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 25
                                  )
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: (){},
                        child: Text("Hate it"),
                      )
                    ],
                  ),
                )
              );

            }
        ),
      )
      );
  }
}

// ignore: must_be_immutable
class ElevatedCardExample extends StatelessWidget {
  Widget child;
  ElevatedCardExample({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10,
        child: SizedBox(
          width: 400,
          height: 200,
          child: child,
        ),
      ),
    );
  }
}