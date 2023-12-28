import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../App/locator.dart';
import '../UI/Facilities/facilities_screen.dart';
import '../UI/Home/home_list_view_screen.dart';
import '../UI/Home/home_map_view_screen.dart';
import '../UI/Home/menu_screen.dart';
import '../UI/documents/add_document_screen.dart';
import '../UI/documents/document_screen.dart';
import '../Utils/color_utils.dart';
import '../Utils/image_utils.dart';
import '../ViewModels/main_view_model.dart';

class MyBottomNavBar extends StatefulWidget {
  bool? fromAgent;
  int? index;

  MyBottomNavBar({this.fromAgent, this.index, Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int currentIndex = 0;
  Widget? body;

  @override
  void initState() {
    currentIndex = widget.index ?? 0;
    onClick(currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        onModelReady: (model) async {},
        viewModelBuilder: () => locator<MainViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              child: body,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: ColorUtils.white,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: Image.asset(
                      ImageUtils.home2,
                      color: currentIndex != 0
                          ? ColorUtils.blackShade
                          : ColorUtils.tuple,
                    ),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: SvgPicture.asset(
                      ImageUtils.docsvg,
                      color: currentIndex != 1
                          ? ColorUtils.blackShade
                          : ColorUtils.tuple,
                    ),
                  ),
                  label: 'Documents',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: const AddDocumentScreen()));
                      },
                      child: Image.asset(
                        ImageUtils.plusbottomicon,
                      ),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: Image.asset(
                      ImageUtils.facilities,
                      color: currentIndex != 3
                          ? ColorUtils.blackShade
                          : ColorUtils.tuple,
                    ),
                  ),
                  label: 'Facilities',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: SvgPicture.asset(
                      ImageUtils.menusvg,
                      color: currentIndex != 4
                          ? ColorUtils.blackShade
                          : ColorUtils.tuple,
                    ),
                  ),
                  label: 'Menu',
                ),
              ],
              currentIndex: currentIndex,
              //fixedColor: ColorUtils.orangeColor,
              selectedItemColor: ColorUtils.tuple,
              unselectedItemColor: ColorUtils.blackShade,
              //unselectedItemColor: ColorUtils.fieldIconColor,
              unselectedLabelStyle: TextStyle(
                color: ColorUtils.white,
              ),
              //backgroundColor: Colors.green,
              onTap: (index) {
                currentIndex = index;
                //MainView(index: 3,);
                onClick(currentIndex);
                setState(() {});
              },
            ),
          );
        });
  }

  onClick(int selectedIndex) {
    setState(() {
      var model = locator<MainViewModel>();
      currentIndex = selectedIndex;
      switch (currentIndex) {
        case 0:
          body = const HomeListViewScreen();

          break;
        case 1:
          body = DocumentScreen();
          break;
        case 2:
          body = const HomeMapViewScreen();
          break;
        case 3:
          body = const FacilitiesScreen();

          break;
        case 4:
          body = const MenuScreen();
          break;
        // case 5:
        //  body = const FacilitiesScreen2();
        // break;
      }
    });
  }
}
