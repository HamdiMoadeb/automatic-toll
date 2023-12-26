import 'package:tollxpress/core/enums/update_user.dart';
import 'package:tollxpress/core/errors/exceptions.dart';
import 'package:tollxpress/core/errors/failure.dart';
import 'package:tollxpress/feature/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  const AuthRemoteDataSourceImpl(this.client);

  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw const ServerException(message: 'Unimplemented Feature', statusCode: 404);
  }

  @override
  Future<UserModel> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw const ServerException(message: 'Unimplemented Feature', statusCode: 404);
  }

  @override
  Future<void> signUp(
      {required String email,
      required String fullName,
      required String password}) {
    // TODO: implement signUp
    throw const ServerException(message: 'Unimplemented Feature', statusCode: 404);
  }

  @override
  Future<void> updateUser({userData, required UpdateUserAction action}) {
    // TODO: implement updateUser
    throw const ServerException(message: 'Unimplemented Feature', statusCode: 404);
  }
}
