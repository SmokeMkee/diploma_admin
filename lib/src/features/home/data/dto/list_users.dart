
import 'dart:convert';

List<User> usersListFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

class User {
  User({
    this.email,
    this.id,
    this.isActive,
    this.password,
    this.userName,
    this.userType,
    this.userprofile,
  });

  final String? email;
  final int? id;
  final bool? isActive;
  final String? password;
  final String? userName;
  final String? userType;
  final Userprofile? userprofile;
  bool check = false;
  User copyWith({
    String? email,
    int? id,
    bool? isActive,
    String? password,
    String? userName,
    String? userType,
    Userprofile? userprofile,
  }) =>
      User(
        email: email ?? this.email,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        password: password ?? this.password,
        userName: userName ?? this.userName,
        userType: userType ?? this.userType,
        userprofile: userprofile ?? this.userprofile,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        id: json["id"],
        isActive: json["isActive"],
        password: json["password"],
        userName: json["userName"],
        userType: json["userType"],
        userprofile: json["userprofile"] == null
            ? null
            : Userprofile.fromJson(json["userprofile"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "isActive": isActive,
        "password": password,
        "userName": userName,
        "userType": userType,
        "userprofile": userprofile?.toJson(),
      };
}

class Userprofile {
  Userprofile({
    this.birthdate,
    this.city,
    this.country,
    this.email,
    this.id,
    this.name,
    this.patronymic,
    this.phone,
    this.street,
    this.surname,
  });

  final String? birthdate;
  final String? city;
  final String? country;
  final String? email;
  final int? id;
  final String? name;
  final String? patronymic;
  final String? phone;
  final String? street;
  final String? surname;

  Userprofile copyWith({
    String? birthdate,
    String? city,
    String? country,
    String? email,
    int? id,
    String? name,
    String? patronymic,
    String? phone,
    String? street,
    String? surname,
  }) =>
      Userprofile(
        birthdate: birthdate ?? this.birthdate,
        city: city ?? this.city,
        country: country ?? this.country,
        email: email ?? this.email,
        id: id ?? this.id,
        name: name ?? this.name,
        patronymic: patronymic ?? this.patronymic,
        phone: phone ?? this.phone,
        street: street ?? this.street,
        surname: surname ?? this.surname,
      );

  factory Userprofile.fromJson(Map<String, dynamic> json) => Userprofile(
        birthdate: json["birthdate"],
        city: json["city"],
        country: json["country"],
        email: json["email"],
        id: json["id"],
        name: json["name"],
        patronymic: json["patronymic"],
        phone: json["phone"],
        street: json["street"],
        surname: json["surname"],
      );

  Map<String, dynamic> toJson() => {
        "birthdate": birthdate,
        "city": city,
        "country": country,
        "email": email,
        "id": id,
        "name": name,
        "patronymic": patronymic,
        "phone": phone,
        "street": street,
        "surname": surname,
      };
}
