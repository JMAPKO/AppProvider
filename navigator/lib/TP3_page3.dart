import 'package:flutter/material.dart';

class TP3_page3 extends StatelessWidget {
  String? title;

  TP3_page3({Key? key, this.title}) :super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("We are in the page three"),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "rute/1");
                },
                child: Icon(Icons.one_k_outlined)),
            Padding(padding: EdgeInsets.all(8)),
            TextButton(
                onPressed: (){Navigator.pushNamed(context, "rute/2");},
                child: Text("pagina dos")
            )
          ],
        ),
      ),
    );
  }
}