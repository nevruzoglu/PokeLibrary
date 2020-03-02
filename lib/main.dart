import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokelibrary/modal/pokemon.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  PokeData pokeData;

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
        body: GridView.count(
            crossAxisCount: 2,
            children: pokeData.pokemon
                .map((poke) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(poke.img))))
                          ],
                        ),
                      ),
                    ))
                .toList()),
        floatingActionButton: FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.cyan,
            child: Icon(Icons.refresh)),
        drawer: Drawer(),
      ),
    );
  }

  void fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    pokeData = PokeData.fromJson(decodedJson);
  }
}
