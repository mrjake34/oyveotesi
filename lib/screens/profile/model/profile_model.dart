class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? role;

  UserModel({this.firstName, this.lastName, this.email, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
