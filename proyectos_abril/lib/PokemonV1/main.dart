import 'package:flutter/material.dart';
import 'package:proyectos_abril/PokemonV1/helpers/pokemonR.dart';
import 'package:proyectos_abril/PokemonV1/theme/light.dart';
import 'package:proyectos_abril/PokemonV1/widgets/pokeWidget.dart';

void main(){
  runApp(_app());
  
}

class _app extends StatelessWidget{
  
  final url = pokemonR(url: "https://pokeapi.co/api/v2/pokemon");
  _app();

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "pokemon V1",
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("POKE-APP"),
        ),
        body: pokeWidget(url),
      ),
    );
  }

  
}