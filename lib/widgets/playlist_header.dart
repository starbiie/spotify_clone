import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;
  final String selectedContent;
  final Function(String) onContentChange;

  const PlaylistHeader({
    Key? key,
    required this.playlist,
    required this.selectedContent,
    required this.onContentChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: selectedContent == 'All' ? Colors.black : Colors.white,
                backgroundColor: selectedContent == 'All' ? Colors.white : Color(0xFF121212),
              ),
              onPressed: () => onContentChange('All'),
              child: Text(
                'All',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 8),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: selectedContent == 'Music' ? Colors.black : Colors.white,
                backgroundColor: selectedContent == 'Music' ? Colors.white : Color(0xFF121212),
              ),
              onPressed: () => onContentChange('Music'),
              child: Text(
                'Music',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 8),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: selectedContent == 'Podcasts' ? Colors.black : Colors.white,
                backgroundColor: selectedContent == 'Podcasts' ? Colors.white : Color(0xFF121212),
              ),
              onPressed: () => onContentChange('Podcasts'),
              child: Text(
                'Podcasts',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 20.0),
        // _PlaylistButtons(followers: playlist.followers),
        // GridView.builder(
        //   shrinkWrap: true,
        //   itemCount: 8,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 4,
        //     childAspectRatio: 3, // Adjust this value to reduce the height of the containers
        //   ),
        //   itemBuilder: (context, index) {
        //     return Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 5.0),
        //       child: InkWell(
        //         onTap: () {
        //           // Handle tap
        //         },
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Container(
        //             decoration: BoxDecoration(
        //               color: HexColor("FFFFFF").withOpacity(0.20),
        //               borderRadius: BorderRadius.circular(7),
        //             ),
        //             height: 100, // Fixed height
        //             child: Column(
        //               children: [
        //                 SizedBox(height: 15),
        //                 ListTile(
        //                   leading: Container(
        //                     height: 70,
        //                     width: 70,
        //                     decoration: BoxDecoration(
        //                       image: DecorationImage(
        //                         fit: BoxFit.cover,
        //                         image: AssetImage("assets/lofigirl.jpg"),
        //                       ),
        //                     ),
        //                   ),
        //                   title: Text(
        //                     "Trading the way",
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
