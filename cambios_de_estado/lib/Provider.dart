import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier{
  int _contador;


  int get contador => _contador;

  set contador(int value) {
    _contador = value;
  }

  MyProvider(this._contador);

  void incrementarContador(){
    _contador++;
    notifyListeners();
  }

}