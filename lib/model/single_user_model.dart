class SingleUserModel {
  bool? success;
  Data? data;

  SingleUserModel({this.success, this.data});

  SingleUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? fullname;
  String? email;
  String? phonenumber;
  String? date_of_birth;
  String? country;
  String? address;
  String? avatar;
  int? iV;

  Data(
      {this.sId,
      this.fullname,
      this.email,
      this.phonenumber,
      this.date_of_birth,
      this.country,
      this.address,
      this.avatar,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    date_of_birth = json['date_of_birth'];
    country = json['country'];
    address = json['address'];
    avatar = json['avatar'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullname'] = fullname;
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    data['date_of_birth'] = date_of_birth;
    data['country'] = country;
    data['address'] = address;
    data['avatar'] = avatar;
    data['__v'] = iV;
    return data;
  }
}
