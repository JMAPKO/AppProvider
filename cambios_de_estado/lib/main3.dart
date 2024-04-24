import 'package:cambios_de_estado/Provider_prueba3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(Prueba());
}

class Prueba extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "practica Provider",
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => Provider_practica3(Colors.blue, Colors.red,Colors.blue,Colors.yellow),
        child: _HomePage(title: "Practica Provider"),
      ),
    );
  }
}

class _HomePage extends StatelessWidget{
  String? title;
  _HomePage({Key? key, this.title}):super(key: key);

  @override
  Widget build (BuildContext context){
    final _Provider_tres = Provider.of<Provider_practica3>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _Provider_tres.appbar,
        title: Text(title!, style: Theme.of(context).textTheme.headlineSmall,),
        actions: [
          IconButton(onPressed: _Provider_tres.repetir ,icon: Icon(FontAwesomeIcons.repeat, color: CupertinoColors.white,))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 30)),
            Text("Hola Mundo!", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
              ,),
            Padding(padding: EdgeInsets.all(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(25)),
                      color: _Provider_tres.cuadrado,
                  ),
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.square,
                      size: 50,
                      color: CupertinoColors.white,
                    ),
                    onPressed: _Provider_tres.PintaCuadrado,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: _Provider_tres.circulo,
                  ),
                  height:  MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.circle,
                      size: 50,
                      color: CupertinoColors.white,
                    ),
                    onPressed: _Provider_tres.PintaCiculo,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(8)),
            Container(
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: _Provider_tres.triangulo,
              ),
              child: IconButton(
                onPressed: _Provider_tres.PintaTriangulo,
                icon: Icon(
                    FontAwesomeIcons.triangleExclamation,
                    size: 50 ,
                    color: CupertinoColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.handPeace),
        onPressed: _Provider_tres.PintarAwesome,
      ),
    );
  }
}

