import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imraapp/UI/splash_screen.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';

import 'UI/Facilities/food_allergies_screen.dart';
import 'UI/Facilities/newfoodsearch.dart';
import 'UI/Home/test_location.dart';
import 'UI/profilescreen/newprofile screen.dart';
import 'Utils/color_utils.dart';
import 'Utils/size_config.dart';

import 'ViewModels/main_view_model.dart';
import 'app/locator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await configure();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: StackedService.navigatorKey,
    theme: ThemeData(
      // inputDecorationTheme: InputDecorationTheme(
      //   focusedBorder:
      //       UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      // ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorUtils.red,
      ),
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) {
        //await model.getSharedPreference();
      },
      builder: (context, model, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                selectedIconTheme:
                SizeConfig().init(constraints, orientation);
                return
                    //ProfileScreen1();

                    // HomeMapViewScreen();

                    //Locations();
                    //ConfirmLocation();
                    //SeachScreen2();

                    //SelectCountryScreen();

                    //  EnterMedicxalHistoryScreen();
                    // MedicationHistoryScreen();
                    //FoodAllergiesScreen();
                    //  FoodAllergiesScreen();
                    //SelectCountryScreen();
                    // LocationSelectScreen(currentLocation: ,);
                    // newprofile();
                     //FoodAllergiesScreen();
                    //FoodAllergiesScreen1();
                SplashScreen();
                //UserProfileScreen2();
                //HomeBottombarNavScreen();
                
                //const ProfileScreen5();
                //  MyRoutineScreen();
                //FilterFacilityTypeScreen();
                //FilterScreen();
                //QuestionnaireScreen3();
                //SearchResultScreen();
                //AddDocumentScreen2();
                //NewsUpdateScreen();

                //NewsDetailsScreen();

                //TermConditionScreen();
                //PrivacyPolicyScreen();
                //FaqsScreen();

                //SavedLocationScreen();
                //FacilitiesScreen();
                //DocumentScreen();

                // MenuScreen();
                //  HomeListViewScreen();
                //AddDocumentScreen();
                //EditUserProfileScreen2();
                //  EditUserProfileScreen1();
                // ProfileScreen3();

                //ProfileScreen2();
                // ProfileScreen1();
                // SignUpScreen();
                //Login();
                //SplashScreen();
              },
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
