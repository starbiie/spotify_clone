import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../data/data.dart';
import '../../widgets/playlist_header.dart';
import '../../widgets/podcasts.dart';
import '../../widgets/tracks_lists/tracks2.dart';
import '../../widgets/tracks_lists/tracks_list1.dart';
import '../my_spotify/model/models.dart';

class SearchPage extends StatefulWidget {
  final Playlist playlist;
  final List<Song> tracks;

  const SearchPage({
    Key? key,
    required this.playlist,
    required this.tracks,
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: HexColor("131313"),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.chevron_left,
                      size: 28.0, color: HexColor("FFFFFF")),
                ),
              ),
              const SizedBox(width: 16.0),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: HexColor("131313"),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.chevron_right,
                      size: 28.0, color: HexColor("7B7B7B")),
                ),
              ),
            ],
          ),
        ),
        title: SizedBox(
            width: 355,
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade600,
                  hintText: "What do you want to play?",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white))),
            )),
        actions: [
          const SizedBox(width: 8.0),
          InkWell(
            customBorder: CircleBorder(),
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: HexColor("131313"),
                shape: BoxShape.circle,
              ),
              child: Icon(CupertinoIcons.bell,
                  size: 20.0, color: HexColor("FFFFFF")),
            ),
          ),
          SizedBox(width: 5),
          InkWell(
            customBorder: CircleBorder(),
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: HexColor("131313"),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.people_outline,
                  size: 20.0, color: HexColor("FFFFFF")),
            ),
          ),
          SizedBox(width: 5),
          InkWell(
            customBorder: CircleBorder(),
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: HexColor("131313"),
                shape: BoxShape.circle,
              ),
              child:
                  Icon(Icons.person_pin, size: 20.0, color: HexColor("FFFFFF")),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HexColor("909090"),
              Theme.of(context).backgroundColor,
            ],
            stops: const [0, 0.3],
          ),
        ),
        child: Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 60.0,
            ),
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Searches",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Show all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    controller: ScrollController(keepScrollOffset: false),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 14,
                    ),
                    itemBuilder: (context, index) {
                      final track = widget.tracks[index];
                      return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                elevation: 5,
                                child: Container(
                                  height: 305,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF121212),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 140.0, left: 6),
                                child: SizedBox(
                                  width: 165,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStatePropertyAll(5),
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.black12)),
                                      onPressed: () {},
                                      icon: Icon(Icons.close)),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              BrowsAll()
            ],
          ),
        ),
      ),
    );
  }
}

class BrowsAll extends StatelessWidget {
  const BrowsAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Align(


            alignment: Alignment.topLeft,
            child: Text(
              "Browse all",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: brows.length,
          controller: ScrollController(keepScrollOffset: false),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            // childAspectRatio: 0.7,
            // crossAxisSpacing: 0.3,
          ),
          itemBuilder: (context, index) {
            // final track = widget.tracks[index];
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 205,
                        width: 205,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF121212),
                        ),
                      ),
                    ),
                    //
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 140.0, left: 6),
                    //   child: SizedBox(
                    //     width: 165,
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           track.title,
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //         Text(
                    //           track.artist,
                    //           style: const TextStyle(
                    //             color: Colors.grey,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: 205,
                          width: 205,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("909090"),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(brows[index]['img']),
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
