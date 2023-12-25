
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/auth/domain/entities/user.dart';

class UserModel extends LocalUser {
  const UserModel({
    required super.uid,
    required super.email,
    required super.point,
    required super.fullName,
    super.bio,
    super.profilePic,
  });

  const UserModel.empty()
      : this(
          uid: '',
          email: '',
          point: 0,
          fullName: '',
          profilePic: '',
          bio: '',
        );

  UserModel.fromMap(DataMap map)
      : super(
          uid: map["uid"] as String,
          email: map["email"] as String,
          profilePic: map["profilePic"] as String?,
          bio: map["bio"] as String?,
          point: (map["point"] as num).toInt(),
          fullName: map["fullName"] as String,
        );

  DataMap toMap() {
    return {
      'uid': uid,
      'email': email,
      'profilePic': profilePic,
      'bio': bio,
      'point': point,
      'fullName': fullName,
    };
  }

  LocalUser copyWith({
    String? uid,
    String? email,
    String? profilePic,
    String? bio,
    int? point,
    String? fullName,
  }) {
    return LocalUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      bio: bio ?? this.bio,
      point: point ?? this.point,
      fullName: fullName ?? this.fullName,
    );
  }
}
