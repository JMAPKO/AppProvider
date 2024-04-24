import 'dart:math';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PracProvider with ChangeNotifier{
  int _counter;
  Color _colorcito;

  // colores
  int _red = 0;
  int _blue = 0;
  int _green = 0;


  PracProvider(this._counter, this._colorcito);


  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }

  Color get colorcito => _colorcito;


  set colorcito(Color value) {
    _colorcito = value;
  }

  void contar(){
    _counter++;
    notifyListeners();
  }

  void cambiarColores(){
    _red = Random.secure().nextInt(256);
    _blue = Random.secure().nextInt(256);
    _green = Random.secure().nextInt(256);
    _colorcito = Color.fromRGBO(_red, _green, _blue, 1);
    notifyListeners();
  }

}