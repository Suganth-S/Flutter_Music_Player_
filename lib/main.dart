import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_in_background/components/custom_list_view.dart';
import 'package:flutter_music_in_background/model/Musics.dart';
import 'package:flutter_svg/svg.dart';

import 'DetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayer(),
    );
  }
}
//1.create class and design

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  //3.Add list of songs

  List musics;

  @override
  void initState() {
    musics = getList();
    super.initState();
  }

  List getList() {
    return [
      Musics(
          title: "Uptown Funk",
          singer: "One Republic",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows8_5ea7d4f04e41e.jpeg"),
      Musics(
        title: "Black Space",
        singer: "Sia",
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
        image:
            "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows10_5ea7d51d28f24.jpeg",
      ),
      Musics(
        title: "Shake it off",
        singer: "Coldplay",
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
        image:
            "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows2_5ea7d47403432.jpeg",
      ),
      Musics(
          title: "Lean On",
          singer: "T. Schürger",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
          image:
              "https://i.pinimg.com/originals/ea/60/26/ea60268f4374e8840c4529ee1462fa38.jpg"),
      Musics(
          title: "Sugar",
          singer: "Adele",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows7_5ea7d4db364a2.jpeg"),
      Musics(
          title: "Believer",
          singer: "Ed Sheeran",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows6_5ea7d4c7225c1.jpeg"),
      Musics(
          title: "Stressed out",
          singer: "Mark Ronson",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3",
          image:
              "https://i.pinimg.com/originals/7c/a1/08/7ca1080bde6228e9fb8460915d36efdd.jpg"),
      Musics(
          title: "Girls Like You",
          singer: "Maroon 5",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
          image:
              "https://i.pinimg.com/originals/1b/b8/55/1bb8552249faa2f89ffa0d762d87088d.jpg"),
      Musics(
          title: "Let her go",
          singer: "Passenger",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3",
          image:
              "https://64.media.tumblr.com/5b7c0f14e4e50922ccc024573078db42/15bda826b481de6f-5a/s1280x1920/b26b182f789ef7bb7be15b037e2e687b0fbc437d.jpg"),
      Musics(
          title: "Roar",
          singer: "Katy Perry",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3",
          image:
              "https://cdn2.stylecraze.com/wp-content/uploads/2013/11/Jesus-On-Her-Wrist.jpg.webp"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF03174C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF03174C),
          title: Text(
            "Recommended Musics",
            style: TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
                fontSize: 20.0),
          ),
        ),
        body: Stack(children: [
          SvgPicture.asset(
            'assets/bg_home_border.svg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: AlignmentDirectional.topStart,
          ),
          SvgPicture.asset(
            'assets/bg_moon_home.svg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: AlignmentDirectional.topStart,
          ),
          Column(children: [
            //divided into two parts
            //one which consists of list of songs
            Expanded(
              child: ListView.builder(
                  itemCount: getList().length,
                  itemBuilder: (context, index) => customListView(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(mMusic: musics[index])),
                          );
                        },
                        title: musics[index].title,
                        singer: musics[index].singer,
                        image: musics[index].image,
                      )),
            ),
          ]),
        ]));
  }
}
