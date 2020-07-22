import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List data;

  @override
  void initState(){
    this.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("List Views"),
      ),
      body: ListView.builder(

          itemCount: data == null ? 0 : data.length,

          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Column(
                children: <Widget>[

                  Text(data[index]['userId'].toString()),
                  SizedBox(height: 2.0),

                  Text(data[index]['id'].toString()),
                  SizedBox(height: 2.0),

                  Text(data[index]['title']),
                  SizedBox(height: 2.0),

                  Text(data[index]['body']),
                  SizedBox(height: 2.0),

                ],
              ),
            );
          }
      ),
    );
  }

  Future<String> getData() async{

    var response = await http.get(
      "http://jsonplaceholder.typicode.com/posts",
    );

    //print(response.body);
    this.setState(() {
      data = json.decode(response.body);
    });


  }
}


