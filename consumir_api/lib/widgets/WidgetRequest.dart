import 'dart:io';

import 'package:consumir_api/helpers/Base_Request.dart';
import 'package:flutter/material.dart';
import '../models/Item.dart';

class HttpWidget extends StatefulWidget {

  //creamos una variable del tipo de la base_request
  final http_request<Item> _request;

  const HttpWidget(this._request);

  @override
  _HttpWidgetState createState() => _HttpWidgetState();
}

class _HttpWidgetState extends State<HttpWidget> {

  //damos una variable asincrona
  late final Future<Item> FutureItem;

  @override
  void initState() {
    super.initState();
    FutureItem = widget._request.execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //necesita el future item que creamos
        future: FutureItem,
        builder: (BuildContext context, AsyncSnapshot<Item> snapshot) {
          if (snapshot.hasError) {
            return Text("error en la carga masiva de los datos");
          }
          if (snapshot.hasData) {
            Item? item = snapshot.data;
            if (item != null) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text("el ID ES - ${item.id}- y el title: es ${item.Title}"),
                    ],
              ),
          );
          } else {
          return Text("no hay nada para mostrar");
          }
        }
          return CircularProgressIndicator();
        }
    );
  }

}