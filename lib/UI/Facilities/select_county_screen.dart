import 'package:flutter/material.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/whole_loader.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../app/locator.dart';
import '../createprofilescreen/profile_screen1.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  int? selectedOption;
  String? selectedCountryName;
  String? selectedCountryImage;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> countries = [
      {'name': 'USA', 'imagePath': '"assets/images/us.png"'},
      {'name': 'Canada', 'imagePath': '"assets/images/us.png"'},
      {'name': 'Australia', 'imagePath': '"assets/images/us.png"'},
    ];
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.gettingCountry(context);
      },
      builder: (context, model, child) {
        return model.countryLoader == true
            ? WholePageLoader()
            : SafeArea(
                top: false,
                bottom: false,
                child: Scaffold(
                  // backgroundColor: ColorUtils.tuple,
                  body: PageHorizontalMargin(
                    widget: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(ImageUtils.blackbackarrow)),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Select Country ",
                              style: TextStyle(
                                  fontFamily: FontUtils.proxima,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(147, 153, 166, 0.09),
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 15,
                                  top: 15,
                                ),
                                border: InputBorder.none,
                                hintText: 'Search Country',
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.search))),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.countryhistory?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                    '${model.countryhistory![index].name.toString()}'),
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(model
                                        .countryhistory![index].countryImage
                                        .toString())),
                                trailing: Radio<int>(
                                  value: index,
                                  groupValue: selectedOption,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedOption = value!;
                                      selectedOption = value;
                                      selectedCountryName =
                                          model.countryhistory![index].name;
                                      selectedCountryImage = model
                                          .countryhistory![index].countryImage;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
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
                              onPressed: () {
                                if (selectedOption != null) {
                                  // Navigate to the next screen and pass the selected values
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: ProfileScreen1(
                                        selectedCountryName:
                                            selectedCountryName!,
                                        selectedCountryImage:
                                            selectedCountryImage!,
                                      ),
                                    ),
                                  );
                                }
                                print('this is name ${selectedCountryName}');
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
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
