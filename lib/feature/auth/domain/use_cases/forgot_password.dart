import 'package:tollxpress/core/usecase/usecase.dart';
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/auth/domain/repositories/auth_repo.dart';

class ForgotPassword extends UseCase<void, String> {
  final AuthRepo authRepo;

  const ForgotPassword(this.authRepo);

  @override
  ResultFuture call(String email) => authRepo.forgotPassword(email);
}
