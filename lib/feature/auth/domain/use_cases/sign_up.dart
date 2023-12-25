
import 'package:equatable/equatable.dart';
import 'package:tollxpress/core/usecase/usecase.dart';
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/auth/domain/repositories/auth_repo.dart';

class SignUp extends UseCase<void, SignUpParams> {
  final AuthRepo authRepo;

  const SignUp(this.authRepo);

  @override
  ResultFuture<void> call(SignUpParams params) => authRepo.signUp(
    email: params.email,
    password: params.password,
    fullName: params.fullName,
  );
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String fullName;

  const SignUpParams({
    required this.email,
    required this.password,
    required this.fullName,
  });

  const SignUpParams.empty() : this(
    email: '',
    password: '',
    fullName: '',
  );

  @override
  List<Object> get props => [email, fullName,  password];
}
