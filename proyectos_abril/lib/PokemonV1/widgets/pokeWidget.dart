import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_abril/PokemonV1/helpers/baseR.dart';
import 'package:proyectos_abril/PokemonV1/helpers/pokemonR.dart';
import 'package:proyectos_abril/PokemonV1/models/Pokemon.dart';

class pokeWidget extends StatefulWidget{
  final pokemonR _pokemon;
  pokeWidget(this._pokemon);

  _pokeState createState() => _pokeState();
}


class _pokeState extends State<pokeWidget>{
  late Future<dynamic> futurePokemon;
  late int pokeId = 1;

  @override
  void initState() {
    super.initState();
    futurePokemon = widget._pokemon!.ejecutar(pokeId);
  }

  @override
  Widget build (BuildContext context){
    return FutureBuilder(
        future: futurePokemon,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasError){
            return Text("Hubo un error de conexion");
          }
          if(snapshot.hasData){
            Pokemon poke = snapshot.data;
            if(poke != null){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("ID: ${poke.id}"),
                          Divider(),
                          Text("nombre del pokemon: ${poke.name}"),
                          Container(
                            child: Image.network(poke.image,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                  onPressed: beforePokemon,
                                  child: Icon(Icons.navigate_before),
                              ),
                              FloatingActionButton(
                                onPressed: nextPokemon,
                                child: Icon(Icons.navigate_next),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(8, 15, 8, 8),
                            child: TextButton(
                              child: Text("Super Next"),
                              onPressed: superNext,
                            ),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(8, 15, 8, 8),
                            child: TextButton(
                              child: Text("Super before"),
                              onPressed: superBefore,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }
          return CircularProgressIndicator();
        }
    );
  }


   void nextPokemon(){
    setState(() {
      pokeId++;
      futurePokemon = widget._pokemon.ejecutar(pokeId);
    });
  }

  void beforePokemon(){
    setState(() {
      if(pokeId > 1) {
        pokeId--;
        futurePokemon = widget._pokemon.ejecutar(pokeId);
      }
    });
  }


  void superNext() {
    setState(() {
       pokeId += 75;
      futurePokemon = widget._pokemon.ejecutar(pokeId);
    });
  }


  void superBefore() {
    setState(() {
      pokeId -=800;
      if(pokeId <1){
        pokeId = 1;
        futurePokemon = widget._pokemon.ejecutar(pokeId);
      }
      futurePokemon = widget._pokemon.ejecutar(pokeId);

    });
  }
}