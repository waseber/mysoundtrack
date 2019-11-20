import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class SoundPlayer extends StatefulWidget{
  SoundPlayer({Key key, this.title, this.url}) : super(key: key);
  final String title;
  final String url;

  @override
  SoundPlayerState createState() => SoundPlayerState();
}
class SoundPlayerState extends State<SoundPlayer>{
  
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  
  @override
  void initState(){
    super.initState();
    initPlayer();
  }

  void initPlayer(){
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

  }
  String localFilePath;

  bool _playing = false;
  /*Future _loadFile() async {
    final bytes = await readBytes(widget.url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');

    await file.writeAsBytes(bytes);
    if (await file.exists()) {
      setState(() {
        localFilePath = file.path;
      });
    }
  }*/
  
  
  void onComplete(){
    print("hi");
    setState(() {
      _playing = !_playing;
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(      
      child: Center(
        child: Column(
          children: <Widget>[
           Container(
             decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(50.0)
            ),
             child:  IconButton(
              onPressed: () => {
                setState(() {
                  _playing = !_playing;
                }),
                if(_playing){
                  audioCache.play(widget.url),
                  advancedPlayer.onPlayerCompletion.listen((event) {
                  onComplete();                    
                  })
                  
                }else{
                  advancedPlayer.stop()
                },
                
              },                           
              tooltip: "Play",
              icon: Icon(
                _playing ? Icons.stop : Icons.play_arrow,
                color: Colors.white,
                ),
            ),
           ),
            Text(widget.title, style: TextStyle(color: Colors.white,)),
          ],
        ) 
      ),      
    );
  }
}