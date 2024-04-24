import 'dart:async';

import 'package:cambios_de_estado/PruebaControlBloc.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "puebra Stream bloc" ,
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: _HomePage(title: "prueba StreamBloc"),
    );
  }
}

class _HomePage extends StatefulWidget{
  String? title;
  _HomePage({Key? key, this.title}):super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_HomePage>{
  controlbloc control = controlbloc();

  @override
  Widget build (BuildContext context){
    return StreamBuilder(
        stream: control.stream,
        initialData: 0,
        builder: (context, snapshot){
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title!),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${snapshot.data}",style: TextStyle(
                    fontSize: 35
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: control.crecer ,
              child: Icon(Icons.camera),
            ),
          );
        },
    );
  }
  void dispose(){
    control.dispose();
    super.dispose();
  }
}