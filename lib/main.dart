import 'package:flutter/material.dart';
import 'widgets/soundplayer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'My Soundtrack'),
      //home: AudioPlayer(title: "song")
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black87,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
                  SoundPlayer(title: "Whistle", url:"sounds/whistle.mp3"),
                  SoundPlayer(title: "Gong", url:"sounds/gong.mp3"),
                  SoundPlayer(title: "Burp", url:"sounds/burp.mp3"),
                  SoundPlayer(title: "Tympany", url:"sounds/tympany.mp3"),
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
