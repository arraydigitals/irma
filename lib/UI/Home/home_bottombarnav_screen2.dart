// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:imraapp/Utils/image_utils.dart';

// import '../../Utils/color_utils.dart';
// import '../Facilities/facilities_screen.dart';
// import '../documents/add_document_screen.dart';
// import '../documents/document_screen.dart';
// import 'home_list_view_screen.dart';
// import 'home_map_view_screen.dart';
// import 'menu_screen.dart';

// class HomeBottombarNavScreen2 extends StatefulWidget {
//   @override
//   _HomeBottombarNavScreen2State createState() =>
//       _HomeBottombarNavScreen2State();
// }

// class _HomeBottombarNavScreen2State extends State<HomeBottombarNavScreen2> {
//   int _currentIndex = 0;

//   void _onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   final List<Widget> _pages = [
//     const HomeMapViewScreen(),
//          DocumentScreen(),
//     const AddDocumentScreen(),
//     const FacilitiesScreen(),
//     const MenuScreen()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: Container(
//         child: BottomNavigationBar(
//           selectedItemColor: ColorUtils.tuple,
//           unselectedItemColor: Colors.grey,
//           currentIndex: _currentIndex,
//           type: BottomNavigationBarType.fixed,
//           onTap: _onTabTapped,
//           items: [
//             BottomNavigationBarItem(
//               icon: Image.asset(ImageUtils.home2,
//                   color: _currentIndex != 0
//                       ? ColorUtils.blackShade
//                       : ColorUtils.tuple),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(ImageUtils.docsvg,
//                   color: _currentIndex != 1
//                       ? ColorUtils.blackShade
//                       : ColorUtils.tuple),
//               //SvgPicture.asset(ImageUtils.docsvg),
//               // Image.asset(ImageUtils.docicon),
//               label: 'Documents',
//             ),
//             BottomNavigationBarItem(
//               icon: Image.asset(ImageUtils.plusbottomicon),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Image.asset(ImageUtils.facilities,
//                   color: _currentIndex != 3
//                       ? ColorUtils.blackShade
//                       : ColorUtils.tuple),
//               label: 'Facilities',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.menu,
//               ),
//               label: 'Menu',
//             ),
//             // BottomNavigationBarItem(
//             //   icon: Image.asset(ImageUtils.home2),
//             //   label: 'Home',
//             // ),
//             // BottomNavigationBarItem(
//             //   icon:
//             //       //SvgPicture.asset(ImageUtils.docsvg),
//             //       Image.asset(ImageUtils.docicon),
//             //   label: 'Documents',
//             // ),
//             // BottomNavigationBarItem(
//             //   icon: Image.asset(ImageUtils.plusbottomicon),
//             //   label: '',
//             // ),
//             // BottomNavigationBarItem(
//             //   icon: Image.asset(ImageUtils.facilities),
//             //   label: 'Facilities',
//             // ),
//             // const BottomNavigationBarItem(
//             //   icon: Icon(
//             //     Icons.menu,
//             //   ),
//             //   label: 'Menu',
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
