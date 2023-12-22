import 'package:dartz/dartz.dart';
import 'package:tollxpress/core/errors/failure.dart';
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/on_boarding/data/data_sources/on_boarding_local_data_source.dart';
import 'package:tollxpress/feature/on_boarding/domain/repositories/on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  const OnBoardingRepoImpl(this.dataSource);

  final OnBoardingLocalDataSource dataSource;

  @override
  ResultVoid cacheFirstTimer() async {
    try {
      await dataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheFailure catch (e) {
      return Left(
        CacheFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }

  @override
  ResultFuture<bool> checkIfUserFirstTimer() async {
    try {
      final result = await dataSource.checkIfUserIsFirstTimer();
      return Right(result);
    } on CacheFailure catch (e) {
      return Left(
        CacheFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }
}
