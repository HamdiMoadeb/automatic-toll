
import 'package:tollxpress/core/enums/update_user.dart';
import 'package:tollxpress/feature/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  AuthRemoteDataSource();

  Future<void> forgotPassword(String email);

  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String fullName,
    required String password,
  });

  Future<void> updateUser({
    dynamic userData,
    required UpdateUserAction action,
  });


}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{


  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp({required String email, required String fullName, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser({userData, required UpdateUserAction action}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }


}


