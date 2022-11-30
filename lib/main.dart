import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
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
  bool loaded = false;
  final List<String> titles = <String>[];
  final List<String> covers = <String>[];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData(){
    get(Uri.parse("https://yts.torrentbay.to/api/v2/list_movies.json")).then((Response response){
          final Map<String, dynamic> body =  jsonDecode(response.body) as Map<String, dynamic>;
          final Map<String, dynamic> data = body["data"] as Map<String, dynamic>;
          final List<dynamic> movies = data["movies"] as List<dynamic>;
          titles.addAll(movies.map((dynamic movie) => movie['title'] as String));
          covers.addAll(movies.map((dynamic movie) => movie['medium_cover_image'] as String));
          setState(() {
            loaded = true;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Movies")),
      ),
      body: Builder(
        builder: (BuildContext context) {
          if (!loaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return Padding(
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
                                width: MediaQuery.of(context).size.width * .6,
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(cover),
                                      fit: BoxFit.cover
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 30.0,
                                          color: Colors.black,
                                          offset: Offset(0, 70))
                                    ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                                title,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
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
                                  "1/10",
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontSize: 25
                                      )
                                    ),
                                  ),
                                const SizedBox(width: 10),
                                Text(
                                  "BAD",
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                        fontSize: 25
                                      )
                                    ),
                                  ),
                                const SizedBox(width: 10),
                                Text(
                                    "Yuk",
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
            );
          }
        }
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