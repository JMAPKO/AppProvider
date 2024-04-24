import 'package:flutter/material.dart';
import 'practicaProvider.dart';

class provider with ChangeNotifier{
int _numero;

Color _color;


provider(this._numero, this._color);


Color get color => _color;

  set color(Color value) {
    _color = value;
  }

  int get numero => _numero;

  set numero(int value) {
    _numero = value;
  }

  void contar(){
  _numero++;
 _color = (_numero >= 10 && _numero < 20) ? Colors.red :
          (_numero >= 20 && _numero < 30) ? Colors.yellow :
          (_numero >= 30) ? Colors.blue :
          Colors.black;
 notifyListeners();
}
}