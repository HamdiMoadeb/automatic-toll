
import 'package:equatable/equatable.dart';
import 'package:tollxpress/core/usecase/usecase.dart';
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/auth/domain/entities/user.dart';
import 'package:tollxpress/feature/auth/domain/repositories/auth_repo.dart';

class SignIn extends UseCase<LocalUser, SignInParams> {
  final AuthRepo authRepo;

  const SignIn(this.authRepo);

  @override
  ResultFuture<LocalUser> call(SignInParams params) => authRepo.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });

  const SignInParams.empty() : this(
    email: '',
    password: '',
  );

  @override
  String toString() {
    return 'SignInParams{email: $email, password: $password}';
  }

  @override
  List<Object> get props => [email, password];
}
