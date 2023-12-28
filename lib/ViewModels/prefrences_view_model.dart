import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class PreferencesViewModel extends BaseViewModel {
  String? userToken;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userID;
  String? userAvatar;
  String? userCountry;
  String? userLocation;

  //user country
  Future saveUserCountry(String country) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("country", country);
    userCountry = country;
    notifyListeners();
  }

  Future getUserCountry() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userCountry = await sharedPreferences.getString("country");
    notifyListeners();
  }


  //user loction
  Future saveUserLocation(String location) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("location", location);
    userLocation = location;
    notifyListeners();
  }

  Future getUserLocation() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userLocation = await sharedPreferences.getString("location");
    notifyListeners();
  }

//user avatar
Future saveUserAvatar(String avatar) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("avatar", avatar);
    userAvatar = avatar;
    notifyListeners();
  }

  Future getUserAvatar() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userAvatar = await sharedPreferences.getString("avatar");
    notifyListeners();
  }

  Future removeUserAvatar() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("avatar");
    notifyListeners();
  }


//user token
  Future saveUserToken(String tokenValue) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("tokenValue", tokenValue);
    userToken = tokenValue;
    notifyListeners();
  }

  Future getUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userToken = await sharedPreferences.getString("tokenValue");
    notifyListeners();
  }

  Future removeUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("tokenValue");
    notifyListeners();
  }

  // User Name

  Future saveUserName(String fullname) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("fullname", fullname);
    userName = fullname;
    notifyListeners();
  }

  Future getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userName = await sharedPreferences.getString("fullname");
    notifyListeners();
  }

  Future removeUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("fullname");
    notifyListeners();
  }

  //user email

  Future saveUserEmail(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("email", email);
    userEmail = email;
    notifyListeners();
  }

  Future getUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userEmail = await sharedPreferences.getString("email");
    notifyListeners();
  }

  Future removeUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("email");
    notifyListeners();
  }
  //user phone

  Future saveUserPhone(String phone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("phone", phone);
    userPhone = phone;
    notifyListeners();
  }

  Future getUserPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userPhone = await sharedPreferences.getString("phone");
    notifyListeners();
  }

  Future removeUserPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("phone");
    notifyListeners();
  }

  // user id
  Future saveUserID(String userID) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("userID", userID);
    userID = userID;
    notifyListeners();
  }

  Future getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userID = await sharedPreferences.getString("userID");
    notifyListeners();
  }

  Future removeUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("userID");
    notifyListeners();
  }
}
