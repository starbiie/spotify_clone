// import 'package:flutter/material.dart';
// import 'package:spotify_clone/my_spotify/views/widgets/side_menu_icon_tab.dart';
//
// import '../../../data/data.dart';
//
// class SideMenuBar extends StatelessWidget {
//   final void Function(int) onMenuItemSelected;
//
//   SideMenuBar({super.key, required this.onMenuItemSelected});
//   ScrollController? _scrollController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: 280.0,
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Image.asset(
//                     'assets/spotlogo.png',
//                     height: 55.0,
//                     filterQuality: FilterQuality.high,
//                   ),
//                 ),
//               ],
//             ),
//             SideMenuIconTab(
//               iconData: Icons.home,
//               title: 'Home',
//               onTap: () => onMenuItemSelected(0),
//             ),
//             SideMenuIconTab(
//               iconData: Icons.search,
//               title: 'Search',
//               onTap: () => onMenuItemSelected(1),
//             ),
//             SideMenuIconTab(
//               iconData: Icons.audiotrack,
//               title: 'Radio',
//               onTap: () => onMenuItemSelected(2),
//             ),
//             const SizedBox(height: 12.0),
//             Expanded(
//               child: Scrollbar(
//                 thumbVisibility: true,
//                 controller: _scrollController,
//                 child: ListView(
//                   controller: _scrollController,
//                   padding: const EdgeInsets.symmetric(vertical: 12.0),
//                   physics: const ClampingScrollPhysics(),
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 8.0,
//                             horizontal: 16.0,
//                           ),
//                           child: Text(
//                             'YOUR LIBRARY',
//                             style: Theme.of(context).textTheme.headline4,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         ...yourLibrary
//                             .map((e) => ListTile(
//                           dense: true,
//                           title: Text(
//                             e,
//                             style:
//                             Theme.of(context).textTheme.bodyText2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           onTap: () {},
//                         ))
//                             .toList(),
//                       ],
//                     ),
//                     const SizedBox(height: 24.0),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 8.0,
//                             horizontal: 16.0,
//                           ),
//                           child: Text(
//                             'PLAYLISTS',
//                             style: Theme.of(context).textTheme.headline4,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         ...playlists
//                             .map((e) => ListTile(
//                           dense: true,
//                           title: Text(
//                             e,
//                             style:
//                             Theme.of(context).textTheme.bodyText2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           onTap: () {},
//                         ))
//                             .toList(),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
