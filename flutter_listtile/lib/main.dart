import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
    @override
    Widget build (BuildContext context) {
    // TODO: implement build
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
      title: Text("My App"),
      ), // AppBar
      body: ListView (
          children:[
            ListTile(
              title: Text("Manda"),
              subtitle: Text("Sub Title"),
              leading: CircleAvatar(),
              trailing: Text("10.00pm"),
              dense: true,
              tileColor: Colors.amber,
            ),
            Divider(
              color: Colors.amber,
            ),
          ]
        ) // Row
      ), // Scaffold
    ); // MaterialApp
  }
}