import 'package:flutter/material.dart';
import 'package:navigator/TP3_page2.dart';
import 'package:navigator/TP3_page3.dart';

void main(){
  runApp(_app());
}

class _app extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "practica 3",
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: PageOne(title: "APP - Change Page"),
      routes: <String,WidgetBuilder>{ //Cuando definimos rutas va un String y un WidgetBuilder
        "rute/1": (BuildContext context) => PageOne(title: "La primera"),
        "rute/2": (BuildContext context) => TP3_page2(title: "La SEGUNDA"),
        "rute/3": (BuildContext context) => TP3_page3(title: "La TERCERA")
    },
    );
  }
}

class PageOne extends StatelessWidget{
  String? title;
  PageOne({Key? key, this.title}):super(key: key);

  Widget build (BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text(title!),
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenidos a la primera pagina de esta app"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: (){
                    //AHORA COMO HAY RUTAS DEFINIDAS SE USA EL NAVIGATOR.PUSHNAME
                    Navigator.pushNamed(context, "rute/3");
                  },
                  child: Text("Page 3")
                  ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "rute/2");
        },
        child: Text("Run pag 2", textAlign: TextAlign.center,),
      ),
    );
  }
}