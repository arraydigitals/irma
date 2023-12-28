import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imraapp/UI/documents/add_document_screen2.dart';
import 'package:imraapp/UI/documents/document_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/modules/dio_service.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/color_utils.dart';
import '../../../Utils/font_utils.dart';
import '../../../Utils/image_utils.dart';
import '../../../ViewModels/main_view_model.dart';
import '../../../Widgets/custom_text_field.dart';
import '../../../Widgets/customtextfield.dart';
import '../../../Widgets/page_horizontal_margin.dart';
import '../../../Widgets/text_widget.dart';
import '../../../Widgets/textfiled_widget.dart';
import '../../../app/locator.dart';
import '../../Utils/widget_loader.dart';

class AddDocumentScreen extends StatefulWidget {
  const AddDocumentScreen({Key? key}) : super(key: key);

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
  bool isLoading = false;
  File? _image; // This will hold the selected image file
  String userSelectedImage = '';
  TextEditingController docnameController = TextEditingController();
  TextEditingController descpController = TextEditingController();
  ImagePicker _imagePicker = ImagePicker();

  Future<void> createUserDocument(String userId, String description,
      String doc_name, String document) async {
    var dioService = DioService.getInstance();

    // Check if the widget is still mounted before updating the state
    if (!mounted) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    var profileFormData = FormData.fromMap({
      "userId": userId,
      "doc_name": doc_name,
      "description": description,
      "document":
          await MultipartFile.fromFile(document, filename: userSelectedImage),
    });

    try {
      final response = await dioService.post(
        'create-document',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "multipart/form-data",
          },
        ),
        data: profileFormData,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

      if (response.statusCode == 201) {
        if (kDebugMode) {
          print('User created document successfully');
        }
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusMessage}');
        }
        // Handle error response
      }
    } catch (e) {
      print('Error: $e');

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

      // Handle exceptions
    }
  }

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
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorUtils.tuple,
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(ImageUtils.back)),
                                SizedBox(
                                  width: 3.w,
                                ),
                                TextWidget(
                                  textValue: "Add New Document",
                                  fontFamily: FontUtils.interMedium,
                                  fontSize: 2.t,
                                  textColor: ColorUtils.white,
                                ),
                              ],
                            ),
                            //Image.asset(ImageUtils.edit),
                          ],
                        ),
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
                      child: PageHorizontalMargin(
                        widget: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Document Name",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorUtils.silver1,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  controller: docnameController,
                                  decoration: InputDecoration(
                                      hintText: '',
                                      hintStyle: TextStyle(
                                          color: ColorUtils.black,
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 16),
                                      contentPadding: EdgeInsets.only(
                                          left: 5.w,
                                          top: 2.h,
                                          right: 2.w,
                                          bottom: 3.h),
                                      //labelStyle: ,
                                      border: InputBorder.none),
                                  //enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Description",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: ColorUtils.silver1,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  controller: descpController,
                                  //textAlign: TextAlign.justify,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                      hintText: '',
                                      hintStyle: TextStyle(
                                          color: ColorUtils.black,
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 16),
                                      contentPadding: EdgeInsets.only(
                                          left: 1.w,
                                          // top: 2.h,
                                          right: 2.w,
                                          bottom: 3.h),
                                      //labelStyle: ,
                                      border: InputBorder.none),
                                  //enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              InkWell(
                                onTap: () {
                                  showImagePickerDialog(
                                    currentBuildContext: context,
                                    onImageSelection: onImageSelection,
                                  );
                                  // _pickImage(ImageSource.gallery);
                                  //_settingModalBottomSheet(context);
                                },
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(5),
                                  color: const Color(0xFFAAAFBB),
                                  strokeWidth: 2,
                                  dashPattern: const [
                                    5,
                                    5,
                                  ],
                                  child: Container(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(ImageUtils.upload),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          "Upload Document",
                                          style: TextStyle(
                                            fontFamily: FontUtils.interSemiBold,
                                            fontSize: 1.4.t,
                                            color: ColorUtils.silver,
                                            // Color.fromRGBO(2, 104, 81, 1)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // Container(
                              //     child: userSelectedImage != null
                              //         ? ListTile(
                              //             leading: Container(
                              //               width: 100,
                              //               height: 50,
                              //               child: Image.network(
                              //                 userSelectedImage,
                              //                 fit: BoxFit.cover,
                              //               ),
                              //             ),
                              //             title: Text('Documet')
                              //             //Text(_image.toString()),
                              //             )
                              //         : child),
                              // Row(children: [Container(
                              //   width: 100,
                              //   height: 50,
                              //   child: Image.file(_image!,fit: BoxFit.cover,),)],),
                              //Text(_image.toString()),
                              SizedBox(
                                height: 20.h,
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xFFF7F7F9),
                                  ),
                                  child: MaterialButton(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    onPressed: isLoading
                                        ? null // Disable button when loading
                                        : () async {
                                            // Set loading to true when the button is pressed
                                            setState(() {
                                              isLoading = true;
                                            });

                                            try {
                                              await createUserDocument(
                                                model.userID
                                                    .toString(),
                                                descpController.text.toString(),
                                                docnameController.text
                                                    .toString(),
                                                userSelectedImage,
                                              );
                                              // Navigate only if the API call is successful
                                              Navigator.pop(context);
                                            } finally {
                                              // Set loading to false regardless of success or failure
                                              setState(() {
                                                isLoading = false;
                                              });
                                            }
                                          },
                                    child: isLoading
                                        ? CircularProgressIndicator(
                                            color: Colors.teal,
                                          ) // Show CircularProgressIndicator when loading
                                        : Text(
                                            "Submit",
                                            style: TextStyle(
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 1.8.t,
                                              color: ColorUtils.silver,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   decoration: const BoxDecoration(
                              //     shape: BoxShape.rectangle,
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(25.0)),
                              //   ),
                              //   child: AnimatedContainer(
                              //       duration: const Duration(milliseconds: 400),
                              //       width:
                              //           MediaQuery.of(context).size.width / 1,
                              //       height: 7.h,
                              //       //margin: EdgeInsets.symmetric(horizontal: 5.w),
                              //       decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(8),
                              //           color: const Color(0xFFF7F7F9)),
                              //       child: MaterialButton(
                              //           padding: EdgeInsets.zero,
                              //           shape: RoundedRectangleBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(25)),
                              //           onPressed: isLoading == true
                              //               ? () {}
                              //               : () async {
                              //                   createUserDocument(
                              //                       model.userID.toString(),
                              //                       descpController.text
                              //                           .toString(),
                              //                       docnameController.text
                              //                           .toString(),
                              //                       userSelectedImage);
                              //                   Navigator.pop(context);
                              //                 },
                              //           child: isLoading == false
                              //               ? // Show loading indicator when _isLoading is true
                              //               Text(
                              //                   "Submit",
                              //                   style: TextStyle(
                              //                     fontFamily:
                              //                         FontUtils.interSemiBold,
                              //                     fontSize: 1.8.t,
                              //                     color: ColorUtils.silver,
                              //                     // Color.fromRGBO(2, 104, 81, 1)
                              //                   ),
                              //                 )
                              //               : WidgetLoader())),
                              // ),
                              SizedBox(
                                height: 5.h,
                              )
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

  void onImageSelection(String imagePath) {
    setState(() {
      userSelectedImage = imagePath;
    });
  }

  _hide() {
    Navigator.pop(context);
  }

  showImagePickerDialog({
    required BuildContext currentBuildContext,
    required void Function(String imagePath) onImageSelection,
  }) async {
    await showDialog(
      context: currentBuildContext,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.grey, // Set your desired color
              padding: const EdgeInsets.all(16.0), // Adjust padding as needed
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      _getFromCamera(onImageSelection);
                    },
                    child: const Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.camera,
                            color: Colors.teal,
                          ),
                          title: Text('Camera'),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _getFromGallery(onImageSelection);
                    },
                    child: const Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.image,
                            color: Colors.teal,
                          ),
                          title: Text('Gallery'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  _getFromGallery(void Function(String imagePath) onImageSelection) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      onImageSelection.call(image.path);
      _hide();
    }
  }

  _getFromCamera(void Function(String imagePath) onImageSelection) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      onImageSelection.call(photo.path);
      _hide();
    }
  }

  static Future<String> convertToBase64(String path) async {
    File file = File(path);
    List<int> fileBytes = await file.readAsBytes();
    String base64String = base64Encode(fileBytes);

    // final fileString = 'audio/mp3;base64,$base64String';

    return base64String;
  }
}
