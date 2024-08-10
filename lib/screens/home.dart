import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spotify_clone/widgets/sponserd.dart';

import '../data/data.dart';
import '../widgets/playlist_header.dart';
import '../widgets/podcasts.dart';
import '../widgets/tracks_lists/tracks2.dart';
import '../widgets/tracks_lists/tracks_list1.dart';

class HomePage extends StatefulWidget {
  final Playlist playlist;
  final List<Song> tracks;

  const HomePage({
    Key? key,
    required this.playlist,
    required this.tracks,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? _scrollController;
  String selectedContent = 'All';

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

  void updateContent(String content) {
    setState(() {
      selectedContent = content;
    });
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
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text(
              'Explore premium',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
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
              Sponserd(playlist: widget.playlist,),
              SizedBox(height: 28),
              PlaylistHeader(
                playlist: widget.playlist,
                selectedContent: selectedContent,
                onContentChange: updateContent,
              ),
              if (selectedContent == 'All') ...[
                TracksList1(tracks: widget.playlist.songs),
                TracksList2(tracks: widget.playlist.songs),
                Podcasts(podcasts: widget.playlist.podcastfits),
              ] else if (selectedContent == 'Music') ...[
                TracksList2(tracks: widget.playlist.songs),
              ] else if (selectedContent == 'Podcasts') ...[
                Podcasts(podcasts: widget.playlist.podcastfits),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
