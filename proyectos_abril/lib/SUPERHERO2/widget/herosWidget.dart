import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_abril/SUPERHERO2/provider/heroProvider.dart';
import 'package:proyectos_abril/SUPERHERO2/service/superHeroService.dart';

import '../models/heros.dart';

class herosWidget extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    final heroP = Provider.of<heroProvider>(context);

    if(heroP.futureHero == null){
      heroP.traerHeroe(1);
    }
    return FutureBuilder(
        future: heroP.futureHero,
        builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasError){
            return Text("error en la conexion");
          }
          if(snapshot.hasData){
            heros? _sh = snapshot.data;
            if (_sh != null){
              return Card(
                elevation: 15,
                child: Column(
                  children: [
                    Text("${_sh.id}"),
                    Text("${_sh.name}"),
                    Container(child: Image.network("${_sh.imagen}"),),
                    Padding(padding: EdgeInsets.all(8),
                      child: Text("${_sh.biografia}"),
                    )
                  ],
                ),
              );
            }
          }
          return CircularProgressIndicator();
        }
    );
  }
}