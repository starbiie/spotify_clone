import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../data/data.dart';

class Sponserd extends StatelessWidget {
  final Playlist playlist;

  const Sponserd({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          height: 250.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(colors: [
                Colors.black38,
                Colors.black12,
              ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/desktop-wallpaper-muhammad-ali-10-muhammed-ali.jpg',
                            ))),
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PLAYLIST',
                            style: Theme.of(context)
                                .textTheme
                                .overline!
                                .copyWith(fontSize: 12.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.black26)),
                                onPressed: () {},
                                child: Text(
                                  "sponsored",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Text(playlist.name,
                          style: Theme.of(context).textTheme.headline2),
                      const SizedBox(height: 16.0),
                      Text(
                        playlist.description,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Created by ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize:
                                      MaterialStatePropertyAll(Size(100, 55)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      HexColor("#1ed760"))),
                              onPressed: () {},
                              child: Text(
                                "Play",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            width: 12,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize:
                                      MaterialStatePropertyAll(Size(100, 55)),
                                  side: MaterialStatePropertyAll(
                                      BorderSide(color: Colors.white54)),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black)),
                              onPressed: () {},
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(width: 8 ,),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
