
import 'package:tollxpress/core/enums/update_user.dart';
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/auth/domain/entities/user.dart';

abstract class AuthRepo {
  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });

  ResultFuture<void> signUp({
    required String email,
    required String fullName,
    required String password,
  });

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    dynamic userData,
  });
}
