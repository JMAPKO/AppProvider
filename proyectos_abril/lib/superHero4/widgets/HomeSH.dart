import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_abril/superHero4/models/myHero.dart';
import 'package:proyectos_abril/superHero4/provider/ProviderSH.dart';


class HomeSH extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    final provider = Provider.of<providerSH>(context);
    if(provider.futureHero == null){
      provider.verHeroe(provider.heroID);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("App - SuperHeros"),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: provider.futureHero,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasError){
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: Text("Error en la conexion con el servidor",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
              ),
            );
          }
          if(snapshot.hasData){
            myHero? superH = snapshot.data;
            if(superH != null){
              return Padding(padding: const EdgeInsets.all(10),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(superH.name),
                      Divider(),
                      Text("${superH.ID}"),
                      Divider(),
                      Container(
                        child: Image.network(superH.image),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Text("Este heroe no tiene datos", style: TextStyle(fontSize: 30),);
            }
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(onPressed: (){provider.beforeHero();} , child: Icon(Icons.navigate_before),), //Anterior Heroe
          FloatingActionButton(onPressed: (){provider.nextHero();}, child: Icon(Icons.navigate_next),) //Siguiente heroe
        ],
      ),
    );
  }
}