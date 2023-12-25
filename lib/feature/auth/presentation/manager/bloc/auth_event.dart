part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;

  const SignUpEvent({
    required this.email,
    required this.password,
    required this.fullName,
  });

  @override
  List<Object> get props => [email, password, fullName];
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  const ForgotPasswordEvent({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class UpdateUserEvent extends AuthEvent {
  final dynamic userData;
  final UpdateUserAction action;

  const UpdateUserEvent({
    required this.userData,
    required this.action,
  });

  @override
  List<Object?> get props => [userData, action];
}