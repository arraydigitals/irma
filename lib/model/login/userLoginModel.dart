class UserLoginModel {
  int? success;
  String? message;
  Data? data;
  String? token;

  UserLoginModel({this.success, this.message, this.data, this.token});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? id;
  String? fullname;
  String? email;
  String? phonenumber;
  String? avatar;

  Data({this.id, this.fullname, this.email, this.phonenumber, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    data['avatar'] = this.avatar;
    return data;
  }
}
