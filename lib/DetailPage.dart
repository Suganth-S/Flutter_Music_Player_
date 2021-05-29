import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_in_background/model/Musics.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key, this.mMusic}) : super(key: key);
  final Musics mMusic;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //8.Setting the player UI Data
  IconData btnIcon = Icons.play_arrow;
  var bgColor=  const Color(0xFF03174C);
  var iconHoverColor = const Color(0xFF065BC3);

  Duration duration = new Duration();
  Duration position = new Duration();

  //9.Now add music player
  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
          //from now we hear song
        });
      }
    }
    //11
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFF03174C),
      body: Container(
        child: Center(
          child: Column(
              children: [
                Container(
                  height: 500.0,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                                image: NetworkImage(widget.mMusic.image),
                                fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [bgColor.withOpacity(0.4), bgColor],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 52.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'PLAYLIST',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                  Text('Best Vibes of the Week',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Icon(
                                Icons.playlist_add,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Spacer(),
                          Text(widget.mMusic.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0)),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            widget.mMusic.singer,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 18.0),
                          ),
                          SizedBox(height: 16.0),
                        ],
                      ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 42.0,
                ),
                Slider.adaptive(
                  //change value after 11 step, and add min and max
                  value: position.inSeconds.toDouble(),
                  min: 0.0,
                  max: duration.inSeconds.toDouble(),
                  onChanged: (value) {},
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.fast_rewind,
                      color: Colors.white54,
                      size: 42.0,
                    ),
                    SizedBox(width: 32.0),
                    Container(
                        decoration: BoxDecoration(
                            color: iconHoverColor,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              //10.lets Build the Pause button
                              playMusic(widget.mMusic.url);
                              if(isPlaying)
                              {
                                audioPlayer.pause();
                                setState(() {
                                  btnIcon = Icons.play_arrow;
                                  isPlaying = false;
                                });
                              }else{
                                audioPlayer.resume();
                                setState(() {
                                  btnIcon = Icons.pause;
                                  isPlaying = true;
                                });
                              }
                            },
                            iconSize: 42.0,
                            icon: Icon(btnIcon),
                            color: Colors.white,
                          )
                          ),
                        ),
                    SizedBox(width: 32.0),
                    Icon(
                      Icons.fast_forward,
                      color: Colors.white54,
                      size: 42.0,
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.bookmark_border,
                      color: iconHoverColor,
                    ),
                    Icon(
                      Icons.shuffle,
                      color: iconHoverColor,
                    ),
                    Icon(
                      Icons.repeat,
                      color: iconHoverColor,
                    ),
                  ],
                ),
                SizedBox(height: 58.0),
              ],
          ),
          ),
        ),
      );
  }
}
