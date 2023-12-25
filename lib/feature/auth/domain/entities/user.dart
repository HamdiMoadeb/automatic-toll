import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  final String uid;
  final String email;
  final String? profilePic;
  final String? bio;
  final int point;
  final String fullName;

  const LocalUser({
    required this.uid,
    required this.email,
    this.profilePic,
    this.bio,
    required this.point,
    required this.fullName,
  });

  const LocalUser.empty()
      : this(
          uid: '',
          email: '',
          point: 0,
          fullName: '',
          profilePic: '',
          bio: '',
        );


  @override
  String toString() {
    return 'LocalUser{uid: $uid, email: $email, profilePic: $profilePic, bio: $bio, point: $point, fullName: $fullName}';
  }

  @override
  List<Object?> get props => [uid, email];


}
