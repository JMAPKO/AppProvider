import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProviderUno with ChangeNotifier{

  String _Text_writing="ninguno";
  String _Text_writed="ninguno";

  TextStyle style_1 =TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize:18 );
  TextStyle style_2 =TextStyle(color: Colors.white,fontSize:12 );


  ProviderUno(
      this._Text_writing, this._Text_writed);

  String get Text_writed => _Text_writed;

  set Text_writed(String value) {
    _Text_writed = value;
  }

  String get Text_writing => _Text_writing;

  set Text_writing(String value) {
    _Text_writing = value;
  }

  void escribiendo(String value){
    _Text_writing = value;
    notifyListeners();
  }

  void escrito(String value){
    _Text_writed = value;
    notifyListeners();
  }


}