
import 'package:tollxpress/core/utils/typedef.dart';

abstract class OnBoardingRepo {
  const OnBoardingRepo();

  ResultVoid cacheFirstTimer();

  ResultFuture<bool> checkIfUserFirstTimer();
}
