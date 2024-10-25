import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); 
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mqHeight = MediaQuery.of(context).size.height;
 final myAppBar = AppBar(
      title: Text('Media Query'),
    );
    final bodyHeight = mqHeight - myAppBar.preferredSize.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: Column(

          children: [
            Container(
              height: bodyHeight * 0.3,
              width: 300,
              color: Colors.amber,
            ),
            Container(
              height: bodyHeight * 0.7,
              color: Colors.red,
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return 
 ListTile(
                    leading: CircleAvatar(),
                    title: Text('Test'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}