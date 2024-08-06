import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  Data data;
  String token;

  UserModel({
    required this.data,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "token": token,
      };
}

class Data {
  DateTime createdAt;
  String password;
  String role;
  int v;
  String name;
  String id;
  String email;
  DateTime updatedAt;

  Data({
    required this.createdAt,
    required this.password,
    required this.role,
    required this.v,
    required this.name,
    required this.id,
    required this.email,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        createdAt: DateTime.parse(json["createdAt"]),
        password: json["password"],
        role: json["role"],
        v: json["__v"],
        name: json["name"],
        id: json["_id"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "password": password,
        "role": role,
        "__v": v,
        "name": name,
        "_id": id,
        "email": email,
        "updatedAt": updatedAt.toIso8601String(),
      };
}
