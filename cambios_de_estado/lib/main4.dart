import 'package:cambios_de_estado/Provider4.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(_myApp());
}

class _myApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return  MaterialApp(
          title: "prueba 4 de Provider",
          theme: ThemeData(useMaterial3: false),
          debugShowCheckedModeBanner: false,
          home: ChangeNotifierProvider(
            create: (context) => provider(0, Colors.black),
            child: _homePage(title: "Ultimo ejercicio Provider") ,
          ),
    );
  }
}

class _homePage extends StatelessWidget{
  String? title;

  _homePage({Key? key,this.title}):super(key: key);
  
  @override
  Widget build (BuildContext context){
    final _contador = Provider.of<provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${_contador.numero}", style: TextStyle(fontSize: 45, color: _contador.color),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _contador.contar,
        child: Icon(Icons.add),
      ),
    );
  }
}