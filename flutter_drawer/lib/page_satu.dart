import 'package:flutter/material.dart';
import 'package:flutter_drawer/main.dart';

class PageSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Center(
        child: Text("Ini Page 1"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MainApp(),
            ));
        },
        child: Icon(Icons.backspace_outlined),
        ),
    );
  }
}