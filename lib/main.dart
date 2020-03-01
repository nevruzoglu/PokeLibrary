import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokelibrary/modal/pokemon.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeLibrary',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('PokeLibrary'),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.cyan,
            child: Icon(Icons.refresh)),
        drawer: Drawer(),
      ),
    );
  }

  void fetchData() async {}
}
