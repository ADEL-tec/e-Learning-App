// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRequestEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? openId;
  int? online;

  LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.openId,
    this.online,
  });

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "description": description,
    "email": email,
    "phone": phone,
    "avatar": avatar,
    "open_id": openId,
    "online": online,
  };
}

//api post response msg
class UserLoginResponseEntity {
  int? code;
  String? msg;
  UserItem? data;

  UserLoginResponseEntity({this.code, this.msg, this.data});

  // factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
  //     UserLoginResponseEntity(
  //       code: json["code"],
  //       msg: json["msg"],
  //       data: UserItem.fromJson(json["data"]),
  //     );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'code': code, 'msg': msg, 'data': data?.toMap()};
  }

  factory UserLoginResponseEntity.fromMap(Map<String, dynamic> map) {
    return UserLoginResponseEntity(
      code: map['code'] != null ? map['code'] as int : null,
      msg: map['msg'] != null ? map['msg'] as String : null,
      data: map['data'] != null
          ? UserItem.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginResponseEntity.fromJson(String source) =>
      UserLoginResponseEntity.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

// login result
class UserItem {
  String? access_token;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;

  UserItem({
    this.access_token,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  });

  // factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
  //   access_token: json["access_token"],
  //   token: json["token"],
  //   name: json["name"],
  //   description: json["description"],
  //   avatar: json["avatar"],
  //   online: json["online"],
  //   type: json["type"],
  // );

  // Map<String, dynamic> toJson() => {
  //   "access_token": access_token,
  //   "token": token,
  //   "name": name,
  //   "description": description,
  //   "avatar": avatar,
  //   "online": online,
  //   "type": type,
  // };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': access_token,
      'token': token,
      'name': name,
      'description': description,
      'avatar': avatar,
      'online': online,
      'type': type,
    };
  }

  factory UserItem.fromMap(Map<String, dynamic> map) {
    return UserItem(
      access_token: map['access_token'] != null
          ? map['access_token'] as String
          : null,
      token: map['token'] != null ? map['token'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      online: map['online'] != null ? map['online'] as int : null,
      type: map['type'] != null ? map['type'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserItem.fromJson(String source) =>
      UserItem.fromMap(json.decode(source) as Map<String, dynamic>);
}

class UserData {
  final String? token;
  final String? name;
  final String? avatar;
  final String? description;
  final int? online;

  UserData({this.token, this.name, this.avatar, this.description, this.online});

  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
      token: data?['token'],
      name: data?['name'],
      avatar: data?['avatar'],
      description: data?['description'],
      online: data?['online'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (name != null) "name": name,
      if (avatar != null) "avatar": avatar,
      if (description != null) "description": description,
      if (online != null) "online": online,
    };
  }
}
