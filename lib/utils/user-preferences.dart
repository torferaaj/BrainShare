import 'dart:convert';

import 'package:brainshare/model/user-model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static late SharedPreferences _preferences;
  static const _keyUser = 'user';
  static const myUser = User(
    // imagePath: "https://media-exp1.licdn.com/dms/image/D5635AQFv_MrGEyvj1Q/profile-framedphoto-shrink_400_400/0/1626582256793?e=1654419600&v=beta&t=dPAzyWebq36fpAABcl9qeyIphuLLSFDimTbuzKoPkoU",
    imagePath: "images/",
    name: "User Name",
    email: "Email Address",
    about: "About yourself",
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async{
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}