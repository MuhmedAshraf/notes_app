class Data {
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(Map<String,dynamic> jsonData) {
    id = jsonData['_id'];
    name = jsonData['name'];
    email = jsonData['email'];
    password = jsonData['password'];
    role = jsonData['role'];
    createdAt = jsonData['createdAt'];
    updatedAt = jsonData['updatedAt'];
    v = jsonData['__v'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['role'] = role;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
