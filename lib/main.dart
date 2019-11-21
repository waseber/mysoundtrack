import 'package:flutter/material.dart';
import 'widgets/soundplayer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Soundtrack',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'My Soundtrack'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 40.0),
                child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                padding: const EdgeInsets.all(4.0),
                children: <Widget>[
                  SoundPlayer(title: "Applause", url:"sounds/applause.mp3"),
                  SoundPlayer(title: "Rimshot", url:"sounds/rimshot.mp3"),
                  SoundPlayer(title: "Laugh", url:"sounds/laugh.mp3"),
                  SoundPlayer(title: "Crickets", url:"sounds/crickets.mp3"),
                  SoundPlayer(title: "Lose", url:"sounds/lose.mp3"),
                  SoundPlayer(title: "Drumroll", url:"sounds/drumroll.mp3"),
                  SoundPlayer(title: "Tympany", url:"sounds/tympany.mp3"),
                  SoundPlayer(title: "Gong", url:"sounds/gong.mp3"),
                  SoundPlayer(title: "Whistle", url:"sounds/whistle.mp3"),
                  SoundPlayer(title: "Burp", url:"sounds/burp.mp3"),
                  SoundPlayer(title: "Explosion", url:"sounds/explosion.mp3"),
                ],
            )
          )
          )
         ]
       )
       ,
      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
