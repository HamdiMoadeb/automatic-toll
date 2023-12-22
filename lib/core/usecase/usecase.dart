import 'package:tollxpress/core/utils/typedef.dart';

abstract class UseCase<T, Params> {
  const UseCase();
  ResultFuture<T> call(Params params);
}

abstract class UseCaseWithoutParams<T> {
  const UseCaseWithoutParams();
  ResultFuture<T> call();
}
