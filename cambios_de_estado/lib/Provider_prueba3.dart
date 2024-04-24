import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider_practica3 with ChangeNotifier{

  Color _appbar;
  Color _cuadrado;
  Color _circulo;
  Color _triangulo;

  Provider_practica3(this._appbar,this._cuadrado, this._circulo, this._triangulo);

  Color get appbar => _appbar;

  set appbar(Color value) {
    _appbar = value;
  }


  Color get triangulo => _triangulo;
  set triangulo(Color value) {
    _triangulo = value;
  }

  Color get circulo => _circulo;
  set circulo(Color value) {
    _circulo = value;
  }

  Color get cuadrado => _cuadrado;
  set cuadrado(Color value) {
    _cuadrado = value;
  }

  void PintaCuadrado(){
    _cuadrado = Colors.red;
    _circulo = Colors.red;
    _triangulo = Colors.red;
    notifyListeners();
  }

  void PintaCiculo(){
    _cuadrado = Colors.blue;
    _circulo = Colors.blue;
    _triangulo = Colors.blue;
    notifyListeners();
  }

  void PintaTriangulo(){
    _cuadrado = Colors.yellow;
    _circulo = Colors.yellow;
    _triangulo = Colors.yellow;
    notifyListeners();
  }

  void PintarAwesome(){
    int rojo;
    int azul;
    int verde;
    Color colores;

    rojo = Random.secure().nextInt(256);
    azul = Random.secure().nextInt(256);
    verde = Random.secure().nextInt(256);
    colores = Color.fromRGBO(rojo, verde, azul, 1);
    _cuadrado = colores;
    rojo = Random.secure().nextInt(256);
    azul = Random.secure().nextInt(256);
    verde = Random.secure().nextInt(256);
    colores = Color.fromRGBO(rojo, verde, azul, 1);
    _circulo = colores;
    rojo = Random.secure().nextInt(256);
    azul = Random.secure().nextInt(256);
    verde = Random.secure().nextInt(256);
    colores = Color.fromRGBO(rojo, verde, azul, 1);
    _triangulo = colores;
    rojo = Random.secure().nextInt(256);
    azul = Random.secure().nextInt(256);
    verde = Random.secure().nextInt(256);
    colores = Color.fromRGBO(rojo, verde, azul, 1);
    _appbar = colores;
    notifyListeners();

  }

  void repetir(){
    _cuadrado = Colors.red;
    _circulo = Colors.blue;
    _triangulo = Colors.yellow;
    _appbar = Colors.blue;
    notifyListeners();
  }


}