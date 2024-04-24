import 'package:cambios_de_estado/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}



////////////////////////////////////////////////////////////////////////////////
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MyProvider(0) ,
        child: MyHomePage(title: "Provider - APP",),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, this.title});

  String? title;

  @override
  Widget build(BuildContext context) {

    //creo una variable/instancia del provider <-------------RE IMPORTANTE
   final _contadorProvider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(title!),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Preciona el boton del contador',
            ),
            Text(
              '${_contadorProvider.contador}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _contadorProvider.incrementarContador,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }


}



