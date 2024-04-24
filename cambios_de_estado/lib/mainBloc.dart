import 'package:cambios_de_estado/controlBloc.dart';
import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: "Provider - APP",),
      );
  }
}

///////////////////////////////////////////////////////////////////////////////
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, this.title});

  String? title;

  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {

  //SE LLAMA AL CONTROLADOR
  ContadorController _control = ContadorController();

  @override
  Widget build(BuildContext context) {
    //en vez de SCAFFOLD creamos un StreamBuilder
    return StreamBuilder(
      //necesitamos colocar la variable stream y un inicial data
      stream: _control.stream ,
      initialData: 0,
      builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(

              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .inversePrimary,

              title: Text(widget.title!),
            ),
            body: Center(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Preciona el boton del contador',
                  ),
                  Text(
                    '${snapshot.data}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _control.contar,
              tooltip: "increment",
              // esto es un mensaje que se pone al posicionarse en el boton
              child: const Icon(Icons.add),
            ),
          );
        }

    );
  }

  @override
  void dispose(){
    _control.dispose();
    super.dispose();
  }

}



