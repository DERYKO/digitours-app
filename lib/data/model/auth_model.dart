import 'package:hive/hive.dart';

part '../adapters/auth_model.g.dart';

@HiveType(typeId: 0)
class AuthModel {
  AuthModel({
    this.phoneNumber,
    this.email,
    this.name,
    this.deviceToken,
  });

  @HiveField(1)
  final String phoneNumber;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String deviceToken;

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'email': email,
      'name': name,
    };
  }

  factory AuthModel.fromuserdata(Map<String, dynamic> userdata) {
    if (userdata == null) return null;
    return AuthModel(
      phoneNumber: userdata['phoneNumber'],
      email: userdata['email'],
      name: userdata['name'],
      deviceToken: userdata['deviceToken'],
    );
  }
}
