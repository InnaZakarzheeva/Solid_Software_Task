import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: MyHomePage(title: 'SolidSoftware Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color = Colors.white;

  final Random random = new Random();
  final textStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.black);

  void randomColor(){
    setState(() {
      _color = new Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1.0
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
          onTap: () => randomColor(),
          child: Container(
            width: _width,
            height: _height,
            color: _color,
            child: Center(
              child: Text(
                'Hey there',
                textAlign: TextAlign.center,
                style: textStyle,
              )
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _color = Colors.white;
          });
        },
        child: Icon(Icons.autorenew),
        backgroundColor: Colors.white,
      ),
    );
  }
}