
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/auth/domain/entities/user.dart';

class UserModel extends LocalUser {
  const UserModel({
    required super.uid,
    required super.email,
    required super.fullName,
    super.profilePic,
  });

  const UserModel.empty()
      : this(
          uid: '',
          email: '',
          fullName: '',
          profilePic: '',
        );

  UserModel.fromMap(DataMap map)
      : super(
          uid: map["uid"] as String,
          email: map["email"] as String,
          profilePic: map["profilePic"] as String?,
          fullName: map["fullName"] as String,
        );

  DataMap toMap() {
    return {
      'uid': uid,
      'email': email,
      'profilePic': profilePic,
      'fullName': fullName,
    };
  }

  LocalUser copyWith({
    String? uid,
    String? email,
    String? profilePic,
    String? fullName,
  }) {
    return LocalUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      fullName: fullName ?? this.fullName,
    );
  }
}
