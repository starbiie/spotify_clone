import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/screens/home.dart';
import 'package:spotify_clone/screens/search_page.dart';
import 'package:spotify_clone/widgets/current_track.dart';
import 'package:spotify_clone/widgets/side_menu.dart';
import 'package:spotify_clone/widgets/your_play_lists.dart';

import 'data/data.dart';
import 'models/current_track_model.dart';
import 'widgets/side_menu_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set minimum window size for desktop platforms
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }
  runApp(
    ChangeNotifierProvider(
      create: (context) => CurrentTrackModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        backgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        hintColor: const Color(0xFF1DB954),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyText1: TextStyle(
            color: Colors.grey[300],
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyText2: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1.0,
          ),
        ),
      ),
      home: Shell(playlist: lofihiphopPlaylist),
    );
  }
}

class Shell extends StatefulWidget {
  final Playlist playlist;

  const Shell({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int _selectedIndex = 0;

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    if (_selectedIndex == 0) {
      currentPage = HomePage(playlist: widget.playlist, tracks: widget.playlist.songs);
    } else if (_selectedIndex == 1) {
      currentPage = SearchPage(playlist: widget.playlist, tracks: widget.playlist.songs);
    } else {
      currentPage = YourPlayLists(); // Added YourPlayLists page
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800)
                  SideMenu(onMenuItemSelected: _onMenuItemSelected),
                Expanded(
                  child: currentPage,
                ),
              ],
            ),
          ),
          CurrentTrack(),
        ],
      ),
    );
  }
}
