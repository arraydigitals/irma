import 'package:flutter/material.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/widget_loader.dart';
import 'package:imraapp/Widgets/bottom_navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/top_margin_home.dart';
import '../../app/locator.dart';
import '../createprofilescreen/profile_screen3.dart';
import '../profilescreen/edit_user_profile_screen2.dart';

class MedicationHistoryScreen extends StatefulWidget {
  const MedicationHistoryScreen({Key? key}) : super(key: key);

  @override
  State<MedicationHistoryScreen> createState() =>
      _MedicationHistoryScreenState();
}

class _MedicationHistoryScreenState extends State<MedicationHistoryScreen> {
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    // DateTime today = DateTime.now();
    // void _onDaySelected(DateTime day, DateTime focusedDay) {
    //   setState(() {
    //     today = day;
    //   });
    // }

    double _startValue = 500;
    double _endValue = 3000;
    int selectedOption = 1;
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            //backgroundColor: ColorUtils.grayf,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  PageHorizontalMargin(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: context.getPadding().top,
                        ),
                        const TopMarginHome(),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  model.navigationService
                                      .navigateToUntil(to: MyBottomNavBar());
                                },
                                child: Image.asset(ImageUtils.blackbackarrow)),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Add Medication History ",
                              style: TextStyle(
                                  fontFamily: FontUtils.proxima,
                                  fontSize: 18,
                                  //color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Enter Details ",
                          style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 16,
                              //color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Medicine ",
                          style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              //color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(170, 175, 187, 0.11),
                              // color: Color(0xFFAAAFBB),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: model.medicineController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 15,
                                //top: 15,
                              ),
                              border: InputBorder.none,
                              hintText: '',
                              // suffixIcon: IconButton(
                              //     onPressed: () {},
                              //     icon: const Icon(Icons.search))
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Reason ",
                          style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              //color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(170, 175, 187, 0.11),
                              // color: Color(0xFFAAAFBB),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: model.reasonsController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 15,
                                // top: 15,
                              ),
                              border: InputBorder.none,
                              hintText: '',
                              // suffixIcon: IconButton(
                              //     onPressed: () {},
                              //     icon: const Icon(Icons.search))
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Prescribed By ",
                          style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              //color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(170, 175, 187, 0.11),
                              // color: Color(0xFFAAAFBB),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: model.prescribedController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 15,
                                //top: 15,
                              ),
                              border: InputBorder.none,
                              hintText: '',
                              // suffixIcon: IconButton(
                              //     onPressed: () {},
                              //     icon: const Icon(Icons.search))
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Date From ",
                              style: TextStyle(
                                  fontFamily: FontUtils.proxima,
                                  fontSize: 14,
                                  //color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              "Date To ",
                              style: TextStyle(
                                  fontFamily: FontUtils.proxima,
                                  fontSize: 14,
                                  //color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          decoration: const BoxDecoration(
                            //color: ColorUtils.silver1,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromRGBO(
                                        170, 175, 187, 0.11),
                                  ),

                                  // height: 50,
                                  // width: 220,
                                  child: TextField(
                                    controller: model.datefromController,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                          left: 15,
                                          top: 15,
                                        ),
                                        border: InputBorder.none,
                                        hintText: '',
                                        suffixIcon: InkWell(
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime
                                                          .now(), //get today's date
                                                      firstDate: DateTime(
                                                          2000), //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2101));
                                              if (pickedDate != null) {
                                                print(
                                                    pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                                String formattedDate = DateFormat(
                                                        'yyyy-MM-dd')
                                                    .format(
                                                        pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                                print(
                                                    formattedDate); //formatted date output using intl package =>  2022-07-04
                                                //You can format date as per your need

                                                setState(() {
                                                  model.datefromController
                                                          .text =
                                                      formattedDate; //set foratted date to TextField value.
                                                });
                                              } else {
                                                print("Date is not selected");
                                              }
                                              // _showModalBottomSheetCalender(
                                              //     context);
                                            },
                                            child: Image.asset(
                                                ImageUtils.calander))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.h,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromRGBO(
                                        170, 175, 187, 0.11),
                                  ),
                                  child: TextField(
                                    controller: model.datetoController,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                          left: 15,
                                          top: 15,
                                        ),
                                        border: InputBorder.none,
                                        hintText: '',
                                        suffixIcon: InkWell(
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime
                                                          .now(), //get today's date
                                                      firstDate: DateTime(
                                                          2000), //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2101));
                                              if (pickedDate != null) {
                                                print(
                                                    pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                                String formattedDate = DateFormat(
                                                        'yyyy-MM-dd')
                                                    .format(
                                                        pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                                print(
                                                    formattedDate); //formatted date output using intl package =>  2022-07-04
                                                //You can format date as per your need

                                                setState(() {
                                                  model.datetoController.text =
                                                      formattedDate; //set foratted date to TextField value.
                                                });
                                              } else {
                                                print("Date is not selected");
                                              }
                                              // _showModalBottomSheetCalender(
                                              //     context);
                                            },
                                            child: Image.asset(
                                                ImageUtils.calander))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            width: MediaQuery.of(context).size.width / 1,
                            height: 7.h,
                            //margin: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorUtils.tuple),
                            child: MaterialButton(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                onPressed: () async {
                                  model.loadingWidget == true
                                      ? () {}
                                      : await model.UserMedicationHistory(
                                          context,
                                          model.userID.toString(),
                                          model.medicineController.text,
                                          model.reasonController.text,
                                          model.prescribedController.text,
                                          model.datefromController.text,
                                          model.datetoController.text);
                                  // Navigator.push(
                                  //     context,
                                  //     PageTransition(
                                  //         type: PageTransitionType.fade,
                                  //         child: const ProfileScreen3()));
                                },
                                child: model.loadingWidget == false
                                    ? Text(
                                        "Submit",
                                        style: TextStyle(
                                          fontFamily: FontUtils.interSemiBold,
                                          fontSize: 1.8.t,
                                          color: ColorUtils.white,
                                          // Color.fromRGBO(2, 104, 81, 1)
                                        ),
                                      )
                                    : const WidgetLoader()),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // calender

  void _showModalBottomSheetCalender(BuildContext context) {
    final model = MainViewModel();
    showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (BuildContext context) {
        return Container(
          // height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: TableCalendar(
                      calendarStyle: const CalendarStyle(),
                      headerStyle: const HeaderStyle(
                        titleCentered: true,

                        // centerHeaderTitle: true,
                        formatButtonVisible: false,
                      ),
                      availableGestures: AvailableGestures.all,
                      selectedDayPredicate: (day) =>
                          isSameDay(day, DateTime.now()),
                      onDaySelected: (date, event) {
                        setState(() {
                          model.datefromController =
                              date as TextEditingController;
                        });
                      },
                      calendarBuilders: const CalendarBuilders(
                          // Customize day cells if needed
                          ),
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    width: MediaQuery.of(context).size.width / 1,
                    //height: 7.h,
                    //margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorUtils.tuple),
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.fade,
                        //         child: const EditUserProfileScreen2()));
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontFamily: FontUtils.interSemiBold,
                          fontSize: 1.8.t,
                          color: ColorUtils.white,
                          // Color.fromRGBO(2, 104, 81, 1)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

//DateTime today = DateTime.now();
//void _onDaySelected(DateTime day,  DateTime focusedDay)
