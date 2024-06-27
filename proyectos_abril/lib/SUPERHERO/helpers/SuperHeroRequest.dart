import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyectos_abril/SUPERHERO/models/superHero.dart';

class superHeroRequest {
  final String url;
  superHeroRequest({required this.url});

  Future<superHero> execute(int id) async{
    final response = await http.get(Uri.parse("$url/$id.json"));

    if(response.statusCode != 200){
      throw http.ClientException("error de conexion");
    }
    return _responseParse(response.body);
  }

  dynamic _responseParse(String response) {
    return superHero.isfromJson(jsonDecode(response));
  }
}