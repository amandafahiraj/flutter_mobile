import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexibel and Expanded"),
      ),
      body: Column(
        children: [
          Flexible(
            //flex: 2,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.red,
              child: Center(
                child: Text('Text 1'),
              ),
            ), 
          ),
          Flexible(
            //flex: 2,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.green,
              child: Center(
                child: Text('Text 2'),
              ),
            ), 
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.amber,
              child: Center(
                child: Text('Text 3'),
              ),
            ), 
          )
        ],
      ),
    );
  }
}
