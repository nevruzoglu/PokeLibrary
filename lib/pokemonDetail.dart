import 'package:flutter/material.dart';
import 'package:pokelibrary/modal/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget() => Stack(
        children: <Widget>[
          Card(
              child: Column(
            children: <Widget>[
              Text(pokemon.name),
              Text('Height: ${pokemon.height}'),
              Text('Weight : ${pokemon.weight}'),
              Text('Types'),
              Row(
                  children: pokemon.type
                      .map(
                        (t) => FilterChip(label: Text(t), onSelected: (b) {}),
                      )
                      .toList()),
            ],
          ))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),
      ),
      body: bodyWidget(),
    );
  }
}
