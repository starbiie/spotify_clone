import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../models/current_track_model.dart';
import '../your_play_lists.dart';

class TracksList1 extends StatefulWidget {
  final List<Song> tracks;

  const TracksList1({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  State<TracksList1> createState() => _TracksList1State();
}

class _TracksList1State extends State<TracksList1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YourPlayLists(),
        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Made For You",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Show all",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: widget.tracks.length,
          controller: ScrollController(keepScrollOffset: false),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            childAspectRatio: 0.9,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 14,
          ),
          itemBuilder: (context, index) {
            final track = widget.tracks[index];
            final selected = context.watch<CurrentTrackModel>().selected?.id == track.id;
            return GestureDetector(
              onTap: () => context.read<CurrentTrackModel>().selectTrack(track),
              child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Stack(
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 305,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selected ? Colors.grey.shade800 : Color(0xFF121212),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 140.0, left: 6),
                      child: SizedBox(
                        width: 165,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              track.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              track.artist,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: 128,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("909090"),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(track.imageUrl),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
