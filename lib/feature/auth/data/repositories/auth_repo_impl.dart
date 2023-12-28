import 'package:dartz/dartz.dart';
import 'package:tollxpress/core/enums/update_user.dart';
import 'package:tollxpress/core/errors/exceptions.dart';
import 'package:tollxpress/core/errors/failure.dart';
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:tollxpress/feature/auth/domain/entities/user.dart';
import 'package:tollxpress/feature/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl(this.remoteDataSource);

  @override
  ResultFuture<void> forgotPassword(String email) async {
    try {
      await remoteDataSource.forgotPassword(email);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<LocalUser> signIn(
      {required String email, required String password}) async {
    try {
      final LocalUser user =
          await remoteDataSource.signIn(email: email, password: password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> signUp(
      {required String email,
      required String fullName,
      required String password}) async {
    try {
      await remoteDataSource.signUp(
          email: email, password: password, fullName: fullName);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> updateUser(
      {required UpdateUserAction action, userData}) async {
    try {
      await remoteDataSource.updateUser(action: action, userData: userData);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
