import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../models/current_track_model.dart';

class Podcasts extends StatefulWidget {
  final List<Podcastsfit> podcasts;

  const Podcasts({
    Key? key,
    required this.podcasts,
  }) : super(key: key);

  @override
  State<Podcasts> createState() => _PodcastsState();
}

class _PodcastsState extends State<Podcasts> {
  @override
  Widget build(BuildContext context) {
    return
      Column(children: [
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Podcasts",
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
          itemCount: widget.podcasts.length,
          controller: ScrollController(keepScrollOffset: false),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            childAspectRatio: 0.9,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 14,
          ),
          itemBuilder: (context, index) {
            final track = widget.podcasts[index];
            final selected = context.watch<CurrentTrackModel>().selected?.id == track.id;

            return GestureDetector(
              // onTap: () => context.read<CurrentTrackModel>().selectTrack(track),
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
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${track.date} .',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  track.duration,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
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

      ],);

  }
}

