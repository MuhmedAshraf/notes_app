import 'Data.dart';

class UserModel {
  String? token;
  Data? data;

  UserModel({
    this.token,
    this.data,
  });

  UserModel.fromJson(Map<String, dynamic> jsonData) {
    token = jsonData['token'];
    data = jsonData['data'] != null ? Data.fromJson(jsonData['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
