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
  
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  String localFilePath;

  Future _loadFile() async {
    final bytes = await readBytes(widget.url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');

    await file.writeAsBytes(bytes);
    if (await file.exists()) {
      setState(() {
        localFilePath = file.path;
      });
    }
  }


  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => audioCache.play(widget.url),
              tooltip: 'Play',
              child: Icon(Icons.play_arrow),
            ),
            Text(widget.title),
          ],
        ) 
      ),      
    );
  }
}