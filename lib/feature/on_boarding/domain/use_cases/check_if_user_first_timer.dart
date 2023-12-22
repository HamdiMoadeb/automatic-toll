import 'package:tollxpress/core/usecase/usecase.dart';
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/on_boarding/domain/repositories/on_boarding_repo.dart';

class CheckIfUserFirstTimer extends UseCaseWithoutParams<bool> {
  final OnBoardingRepo onBoardingRepo;

  CheckIfUserFirstTimer(this.onBoardingRepo);

  @override
  ResultFuture<bool> call() => onBoardingRepo.checkIfUserFirstTimer();
}
