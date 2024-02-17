class UserInformation {
  String? uid;
  String? email;
  UserRole? role;
  UserInformation({this.email, this.role, this.uid});

  UserInformation.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json["email"];
    role = convertStringToUserRole(json['role']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['role'] = role?.converttoString();

    return data;
  }
}

enum UserRole {
  admin,
  public;

  String converttoString() {
    switch (this) {
      case UserRole.admin:
        return "admin";
      default:
        return "public";
    }
  }
}

UserRole convertStringToUserRole(String? value) {
  switch (value) {
    case "admin":
      return UserRole.admin;
    default:
      return UserRole.public;
  }
}
