import 'package:flutter/material.dart';
import 'package:proyectos_abril/SUPERHERO/helpers/SuperHeroRequest.dart';
import 'package:proyectos_abril/SUPERHERO/widgets/widgetHeros.dart';

void main(){
  runApp(_app());
}

class _app extends StatelessWidget{
  final url = superHeroRequest(url: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/id");
  _app();

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "SuperHeros",
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          title: Text("SuperHero - App"),
        ),
        body: widgetHeros(url),
      ),
    );
  }

}