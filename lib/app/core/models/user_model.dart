import 'package:flutter_managers/flutter_managers.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class User extends ClientModel<User> {
  User({
    this.token,
    this.userType,
    this.exp,
    this.iss,
  });

  String? token;
  String? userType;
  int? exp;
  String? iss;

  @override
  User fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
        userType: json["token"] == null
            ? null
            : JwtDecoder.decode(json["token"].toString())["userType"],
        exp: json["token"] == null
            ? null
            : JwtDecoder.decode(json["token"].toString())["exp"],
        iss: json["token"] == null
            ? null
            : JwtDecoder.decode(json["token"].toString())["iss"],
      );

  @override
  Map<String, dynamic>? toJson() => {
        "token": token == null ? null : token,
        "userType": userType == null ? null : userType,
        "exp": exp == null ? null : exp,
        "iss": iss == null ? null : iss,
      };
}
