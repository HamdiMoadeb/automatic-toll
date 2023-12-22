import 'package:tollxpress/core/usecase/usecase.dart';
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/on_boarding/domain/repositories/on_boarding_repo.dart';

class CacheFirstTimer extends UseCaseWithoutParams<void> {
  final OnBoardingRepo onBoardingRepo;

  CacheFirstTimer(this.onBoardingRepo);

  @override
  ResultFuture call() => onBoardingRepo.cacheFirstTimer();
}
