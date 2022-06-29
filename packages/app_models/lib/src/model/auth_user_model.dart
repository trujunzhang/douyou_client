import 'Avatar_user.dart';

class AuthUserModel extends AvatarUser {
  String uid;
  String? email;
  String? username = '';
  String? phoneNumber;
  String? avatarUrl;

  AuthUserModel({
    required this.uid,
    this.email,
    this.phoneNumber,
    this.username,
    this.avatarUrl,
  }) : super(uid, username, avatarUrl);

  static AuthUserModel debugUser() {
    return AuthUserModel(uid: 'debug');
  }

  static AuthUserModel mockedUser() {
    return AuthUserModel(
        uid: 'mockedUID',
        username: 'mockedDisplayName',
        avatarUrl: 'mockedPhotoUrl');
  }
}
