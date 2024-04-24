import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'practicaProvider.dart';

void main(){
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget{
  
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "Contador con Provider",
      theme: ThemeData(useMaterial3: false,),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => PracProvider(0, Colors.red),
        child: _MyHomePage(title: "Contador Provider"),
      ),
    );
  }
}

class _MyHomePage extends StatelessWidget{
  String? title;
  _MyHomePage({Key? key, this.title}):super(key: key);
  
  @override
  Widget build (BuildContext context){
    
    final _contadorProvider = Provider.of<PracProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        backgroundColor: _contadorProvider.colorcito,
        actions: [
          IconButton(
          onPressed: _contadorProvider.cambiarColores,
          icon: Icon(CupertinoIcons.arrow_clockwise_circle_fill,color: CupertinoColors.white,)
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("El Numero de su contador es:", style: Theme.of(context).textTheme.headlineMedium,),
            Text("${_contadorProvider.counter}", style: TextStyle(color: Colors.red, fontSize: 50),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _contadorProvider.contar,
        backgroundColor: _contadorProvider.colorcito,
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}