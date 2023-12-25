import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  final String uid;
  final String email;
  final String? profilePic;
  final String fullName;

  const LocalUser({
    required this.uid,
    required this.email,
    this.profilePic,
    required this.fullName,
  });

  const LocalUser.empty()
      : this(
          uid: '',
          email: '',
          fullName: '',
          profilePic: '',
        );


  @override
  String toString() {
    return 'LocalUser{uid: $uid, email: $email, profilePic: $profilePic,fullName: $fullName}';
  }

  @override
  List<Object?> get props => [uid, email];


}
