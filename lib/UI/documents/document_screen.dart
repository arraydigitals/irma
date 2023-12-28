import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imraapp/UI/searchScreen/search_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/whole_loader.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/custom_text_field.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../Widgets/textfiled_widget.dart';
import '../../app/locator.dart';
import 'edit_add_document_screen.dart';
import 'package:share_plus/share_plus.dart';

class DocumentScreen extends StatefulWidget {
  DocumentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.gettingDocumets(context, model.userID.toString());
      },
      builder: (context, model, child) {
        return model.documentLoader == true
            ? WholePageLoader()
            : SafeArea(
                top: false,
                bottom: false,
                child: Scaffold(
                  // backgroundColor: ColorUtils.tuple,
                  body: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorUtils.tuple,
                        gradient:
                            LinearGradient(begin: Alignment.topCenter, colors: [
                          ColorUtils.tuple,
                          ColorUtils.tuple,
                          ColorUtils.tuple,
                          // Colors.orange,
                          // Colors.orange
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    textValue: "Documents",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.white,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: SingleChildScrollView(
                              child: PageHorizontalMargin(
                                widget: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              147, 153, 166, 0.09),
                                          // color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                              left: 15,
                                              top: 15,
                                            ),
                                            border: InputBorder.none,
                                            hintText: 'Search',
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              SeachScreen()));
                                                },
                                                icon:
                                                    const Icon(Icons.search))),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    SizedBox(
                                      child: GridView.builder(
                                        itemCount:
                                            model.documenthistory?.length ?? 0,
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        primary: false,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                //1.35
                                                childAspectRatio: 2.9),
                                        itemBuilder: (context, index) {
                                          String createdAtString = model
                                              .documenthistory![index].createdAt
                                              .toString();
                                          // Convert the string to a DateTime object
                                          DateTime createdAt =
                                              DateTime.parse(createdAtString);

// FormattheDateTime obje
                                          String formattedDate =
                                              DateFormat('dd MMM, hh:mma')
                                                  .format(createdAt);
                                          return GestureDetector(
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     PageTransition(
                                              //         type: PageTransitionType.fade,
                                              //         child: const DeliverResaurantCheckoutPage2()));
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: ColorUtils.grayf),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: ListTile(
                                                onTap: () {
                                                  _shareMoreModalBottomSheet(
                                                    context,
                                                    model
                                                        .documenthistory![index]
                                                        .sId
                                                        .toString(),
                                                  );
                                                },
                                                leading: Container(
                                                    padding: EdgeInsets.all(10),
                                                    // height: 70,
                                                    // width: 50,
                                                    decoration: BoxDecoration(
                                                        color: const Color.fromRGBO(
                                                            233, 235, 237, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Image.network(model
                                                            .documenthistory![
                                                                index]
                                                            .document
                                                            .toString()))),
                                                title: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              model
                                                                  .documenthistory![
                                                                      index]
                                                                  .doc_name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .proxima,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              model
                                                                  .documenthistory![
                                                                      index]
                                                                  .description
                                                                  .toString(),
                                                              //"Seha Emirates Hospital",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .proxima,
                                                                  fontSize: 12,
                                                                  color:
                                                                      ColorUtils
                                                                          .tuple,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              formattedDate,
                                                              // "25 Dec, 08:00PM",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .proxima,
                                                                  fontSize: 12,
                                                                  color: ColorUtils
                                                                      .textcolor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                trailing: Image.asset(
                                                    ImageUtils.moreicon),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}

//Share More ModelBottomeshett
void _shareMoreModalBottomSheet(context, String documentId) {
  showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          //padding: EdgeInsets.only(top: 10),
          height: 30.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: PageHorizontalMargin(
            widget: Column(
              children: <Widget>[
                SizedBox(
                  height: 3.h,
                ),
                ListTile(
                  onTap: () {
                    _shareModalBottomSheet(
                        context, 'Document Name', 'Document Description');
                  },
                  leading: Image.asset(ImageUtils.share1),
                  title: TextWidget(
                    textValue: "Share",
                    fontFamily: FontUtils.interMedium,
                    fontSize: 2.3.t,
                    textColor: ColorUtils.black,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Image.asset(ImageUtils.download),
                  title: TextWidget(
                    textValue: "Download",
                    fontFamily: FontUtils.interMedium,
                    fontSize: 2.3.t,
                    textColor: ColorUtils.black,
                  ),
                ),
                // ListTile(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         PageTransition(
                //             type: PageTransitionType.fade,
                //             child: EditAddDocumentScreen()));
                //   },
                //   leading: Image.asset(ImageUtils.editicon),
                //   title: TextWidget(
                //     textValue: "Edit Document",
                //     fontFamily: FontUtils.interMedium,
                //     fontSize: 2.3.t,
                //     textColor: ColorUtils.black,
                //   ),
                // ),
                // ListTile(
                //   onTap: () {
                //     _deleteModalBottomSheet(context);
                //   },
                //   leading: Image.asset(ImageUtils.delete),
                //   title: TextWidget(
                //     textValue: "Delete",
                //     fontFamily: FontUtils.interMedium,
                //     fontSize: 2.3.t,
                //     textColor: ColorUtils.black,
                //   ),
                // ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        );
      });
}

void _shareModalBottomSheet(
    BuildContext context, String docName, String description) {
  showModalBottomSheet(
    backgroundColor: Colors.grey,
    context: context,
    builder: (BuildContext bc) {
      return Container(
        height: 40.w,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: PageHorizontalMargin(
          widget: Column(
            children: <Widget>[
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  TextWidget(
                    textValue: "Share",
                    fontFamily: FontUtils.interMedium,
                    fontSize: 2.3.t,
                    textColor: ColorUtils.black,
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildShareButton(() {
                    Share.share(
                        'Check out this document: $docName\n\nDescription: $description');
                  }, ImageUtils.messanger),
                  _buildShareButton(() {
                    Share.share(
                        'Check out this document: $docName\n\nDescription: $description',
                        subject: 'Shared Document');
                  }, ImageUtils.whatapp1),
                  _buildShareButton(() {
                    Share.share(
                        'Check out this document: $docName\n\nDescription: $description',
                        subject: 'Shared Document',
                        sharePositionOrigin:
                            Rect.fromCircle(center: Offset(0, 0), radius: 100));
                  }, ImageUtils.mail),
                  _buildShareButton(() {
                    Share.share(
                        'Check out this document: $docName\n\nDescription: $description',
                        subject: 'Shared Document',
                        sharePositionOrigin:
                            Rect.fromCircle(center: Offset(0, 0), radius: 100));
                  }, ImageUtils.skype),
                  _buildShareButton(() {
                    Share.share(
                        'Check out this document: $docName\n\nDescription: $description',
                        subject: 'Shared Document',
                        sharePositionOrigin:
                            Rect.fromCircle(center: Offset(0, 0), radius: 100));
                  }, ImageUtils.moreh),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildShareButton(VoidCallback onPressed, String imagePath) {
  return IconButton(
    onPressed: onPressed,
    icon: Image.asset(imagePath),
  );
}
// share modelBOttom sheet
// void _shareModalBottomSheet(context) {
//   showModalBottomSheet(
//       backgroundColor: Colors.grey,
//       context: context,
//       builder: (BuildContext bc) {
//         return Container(
//           height: 40.w,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: PageHorizontalMargin(
//             widget: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 Row(
//                   children: [
//                     TextWidget(
//                       textValue: "Share",
//                       fontFamily: FontUtils.interMedium,
//                       fontSize: 2.3.t,
//                       textColor: ColorUtils.black,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Image.asset(ImageUtils.messanger),
//                     Image.asset(ImageUtils.whatapp1),
//                     Image.asset(ImageUtils.mail),
//                     Image.asset(ImageUtils.skype),
//                     Image.asset(ImageUtils.moreh),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       });
// }

// Delete modalBOttom sheet
void _deleteModalBottomSheet(context) {
  showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 40.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: PageHorizontalMargin(
            widget: Column(
              children: <Widget>[
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    TextWidget(
                      textValue: "Are you sure you want to delete?",
                      fontFamily: FontUtils.interMedium,
                      fontSize: 2.3.t,
                      textColor: ColorUtils.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: ColorUtils.grayf),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: ColorUtils.tuple),
                        ),
                        child: const Text('Yes'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
