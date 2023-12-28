import 'package:flutter/material.dart';
import 'package:imraapp/UI/documents/document_screen.dart';

import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/widget_loader.dart';
import 'package:imraapp/modules/navigation_service.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../ViewModels/main_view_model.dart';

import '../../Widgets/bottom_navigation_bar.dart';
import '../../Widgets/page_horizontal_margin.dart';

import '../../Widgets/top_margin_home.dart';
import '../../app/locator.dart';
import '../createprofilescreen/profile_screen2.dart';
import '../profilescreen/edit_user_profile_screen2.dart';

class EnterMedicxalHistoryScreen extends StatefulWidget {
  const EnterMedicxalHistoryScreen({Key? key}) : super(key: key);

  @override
  State<EnterMedicxalHistoryScreen> createState() =>
      _EnterMedicxalHistoryScreenState();
}

class _EnterMedicxalHistoryScreenState
    extends State<EnterMedicxalHistoryScreen> {
  //TextEditingController dateController = TextEditingController();

  // @override
  // void initState() {
  //   dateController.text = ""; //set the initial value of text field
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            // backgroundColor: ColorUtils.tuple,
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
                              "Add Medical History ",
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
                          "Procedure ",
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
                            controller: model.procedureController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 15,
                                //top: 10,
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
                            controller: model.reasonController,
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
                          "Medical Center ",
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
                            controller: model.centerController,
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
                        SizedBox(height: 2.h),
                        Text(
                          "Date ",
                          style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              //color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        // Row(
                        //   //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Text(
                        //       "Date From ",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.proxima,
                        //           fontSize: 14,
                        //           //color: const Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //     SizedBox(
                        //       width: 30.w,
                        //     ),
                        //     Text(
                        //       "Date To ",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.proxima,
                        //           fontSize: 14,
                        //           //color: const Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w600),
                        //     )
                        //   ],
                        // ),
                        SizedBox(
                          height: 1.h,
                        ),
                        //Text(dateController.text),
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(170, 175, 187, 0.11),
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
                                  decoration: const BoxDecoration(),

                                  // height: 50,
                                  // width: 220,
                                  child: TextField(
                                    controller: model.dateController,
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
                                                  model.dateController.text =
                                                      formattedDate; //set foratted date to TextField value.
                                                });
                                              } else {
                                                print("Date is not selected");
                                              }
                                              // _showModalBottomSheetCalender(
                                              // context);
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
                                      : await model.UserMedicalHistory(
                                          context,
                                          model.userID.toString(),
                                          model.procedureController.text,
                                          model.reasonController.text,
                                          model.centerController.text,
                                          model.dateController.text,
                                          // model.Receptionid.toString()
                                        );
                                  // Navigator.push(
                                  //     context,
                                  //     PageTransition(
                                  //         type: PageTransitionType.fade,
                                  //         child: const ProfileScreen2()));
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

  void _showModalBottomSheetCalender(BuildContext context) {
    CalendarFormat _calendarFormat = CalendarFormat.month;
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;
    showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(20))),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,

                    calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                            color: ColorUtils.tuple, shape: BoxShape.circle),
                        selectedDecoration: BoxDecoration(
                            color: ColorUtils.greenf, shape: BoxShape.circle)),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: FontUtils.proxima,
                        fontSize: 16,
                      ),
                      leftChevronIcon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorUtils.tuple,
                      ),
                      rightChevronIcon: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorUtils.tuple,
                      ),
                      // centerHeaderTitle: true,
                      formatButtonVisible: false,
                    ),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    availableGestures: AvailableGestures.all,

                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    // onPageChanged: (focusedDay) {
                    //   // No need to call `setState()` here
                    //   _focusedDay = focusedDay;
                    // },
                    calendarBuilders: const CalendarBuilders(
                        // Customize day cells if needed
                        ),

                    // rowHeight: 60,
                    // daysOfWeekHeight: 60,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: const EditUserProfileScreen2()));
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
