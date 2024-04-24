// hay que crear el controlador

import 'dart:async';

import 'package:async/async.dart';

class ContadorController {

  // se crea una apertura
  final _streamControl = StreamController<int>();

  Sink<int> get sink => _streamControl.sink;
  Stream<int> get stream => _streamControl.stream;

  int _contador = 0;
  
  // creamos funcion
  void contar(){
    sink.add(++_contador);
  }
  


  //se crea un cierre
  dispose() => _streamControl.close();
}