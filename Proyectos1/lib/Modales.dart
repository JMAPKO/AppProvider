import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'EnglishProvider.dart';

class Modals extends StatelessWidget{
  final String title;
  Modals({Key? key, required this.title}):super(key: key);

  Widget build (BuildContext context){

    final pro = Provider.of<eng_provider>(context);

    return Scaffold(
      backgroundColor: Colors.yellowAccent[100],
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network("https://imgs.search.brave.com/fSMwaOiZPndVdSGcw0V9TmeRudqJzFP3iKCw1xxYrJc/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/dmVkYW50dS5jb20v/c2VvL2NvbnRlbnQt/aW1hZ2VzL2UzMjEz/MzY4LTM1NWYtNDQ3/Yy04OTQ5LWZjMGQ4/NTBiM2I1My5wbmc",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Modals", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.cyan[700]),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.75,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemCount: pro.Auxiliares.length,
                  itemBuilder: (context, index) {
                    final modals = pro.Auxiliares.elementAt(index);
                    return Card(
                        elevation: 15,

                        child: InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text(modals.explicacion, style: TextStyle(fontSize: 12),),
                                    content: Container(
                                      width: 800,
                                      color: Colors.orange[100],
                                      padding: EdgeInsets.all(15),
                                      child: Text(modals.ejemplo, style: TextStyle(fontSize: 15, wordSpacing: 2),),
                                    ),
                                  );
                                }
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 100,
                                    offset: Offset(1,15)
                                )],
                                gradient: LinearGradient(
                                    colors: [Colors.green[200]!, Colors.blue[100]!]
                                ),
                                borderRadius: BorderRadius.all(Radius.elliptical(30, 2))
                            ),
                            padding: EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.8),
                                    child: Text(modals.name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18, color: Colors.red),),
                                  ),
                                  Text(modals.tiempo, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ),
                        )
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}