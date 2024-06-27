import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_abril/SUPERHERO2/provider/heroProvider.dart';
import 'package:proyectos_abril/SUPERHERO2/service/superHeroService.dart';
import 'package:proyectos_abril/SUPERHERO2/widget/herosWidget.dart';

void main(){
  runApp(_APP());
}

class _APP extends StatelessWidget{
  final url = superHeroService(url: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/id");

  _APP();

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "heros",
      theme: ThemeData(useMaterial3: false),
      home: ChangeNotifierProvider(
        create: (context) => heroProvider(url),
        child: Scaffold(
          appBar: AppBar(
          title: Text("Heroes App - Practice"),
          ),
          body: herosWidget(),
        ),
      ),
    );
  }
}