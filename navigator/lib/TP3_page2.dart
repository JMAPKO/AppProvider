import 'package:flutter/material.dart';

class TP3_page2 extends StatelessWidget{
  String? title;
  TP3_page2({Key? key, this.title}):super(key: key);

  Widget build (BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text(title!),
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Estamos en una nueva Page"),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "rute/1");
                },
                child: Text("PAGINA UNO")),
            Padding(padding: EdgeInsets.all(8)),
            TextButton(
                onPressed: (){Navigator.pushNamed(context, "rute/3");},
                child: Text("pagina 3")
            )
          ],
        ),
      ),
    );
  }
}