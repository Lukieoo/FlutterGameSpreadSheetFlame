 
import 'package:flutter/material.dart';
import 'package:flame/animation.dart' as animation; // imports the Animation class under animation.Animation
import 'package:flame/flame.dart'; // imports the Flame helper class
import 'package:flame/position.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

 int counter = 0;
 
  void _incrementCounter() {
    setState(() {
        counter=counter+96;
    });
  }

 @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('Animation as a Widget Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hi there! This is a regular Flutter app,'),
            Text('with a complex widget tree and also'),
            Text('some pretty sprite sheet animations :)'),
            Flame.util.animationAsWidget(Position(350, 350), animation.Animation.sequenced(
              'minotaur.png', 5, textureWidth: 96,textureHeight: 96,textureY:  counter.toDouble())),
            Text('Neat, hum?'),
            Text('Sprites from Elthen\'s amazing work on itch.io:'),
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter() ,
        child: Icon(Icons.add),
      ),
    );
  }
}
