import 'package:flutter/material.dart';
import 'package:proyectos_abril/SUPERHERO/helpers/SuperHeroRequest.dart';
import '../models/superHero.dart';

class widgetHeros extends StatefulWidget{
   final superHeroRequest _heros;
  widgetHeros(this._heros);

  _widgetState createState() => _widgetState();
}

class _widgetState extends State<widgetHeros>{
  late Future<dynamic> futureHero;
  late  int idHero = 1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureHero = widget._heros!.execute(idHero);
  }

  @override
  Widget build (BuildContext context){
    return FutureBuilder(future: futureHero, builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
      if(snapshot.hasError){
        return Text("error de conexion: ${snapshot.hasError}");
      }
      if(snapshot.hasData){
        superHero Hero = snapshot.data;
        if(Hero != null){
          return Padding(padding: EdgeInsets.all(8),
            child: Card(
              elevation: 15,
              color: Colors.cyan,
              child: Column(
                children: [
                  Text(Hero.nombre),
                  Text("ID: ${Hero.id}"),
                  Container(child: Image.network("${Hero.foto}"),)
                ],
              ),
            ),
          );
        }
      }
      return CircularProgressIndicator();
    }
    );
  }

}