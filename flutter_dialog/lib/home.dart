import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "Belum ada Input";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Center(
        child: Text(data,
        style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        print("Telah Di Klik");
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              title: Text("OK"),
              content: Text("Apakah di hapus?"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      data = "True";
                    });
                  },
                  child: Text("Yes"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of.(context).pop();
                      setState(() {
                        data = "False";
                      });
                    },
                    child: Text("No"))
                )
              ],
            );
          },
          ).then((value) => print(value) );
      },
      child: Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}