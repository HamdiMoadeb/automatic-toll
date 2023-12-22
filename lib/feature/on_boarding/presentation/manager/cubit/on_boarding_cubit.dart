import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tollxpress/feature/on_boarding/domain/use_cases/cache_first_timer.dart';
import 'package:tollxpress/feature/on_boarding/domain/use_cases/check_if_user_first_timer.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({
    required CheckIfUserFirstTimer checkIfUserFirstTimer,
    required CacheFirstTimer cacheFirstTimer,
  })  : _cacheFirstTimer = cacheFirstTimer,
        _checkIfUserFirstTimer = checkIfUserFirstTimer,
        super(OnBoardingInitial());

  final CheckIfUserFirstTimer _checkIfUserFirstTimer;
  final CacheFirstTimer _cacheFirstTimer;

  Future<void> cacheFirstTimer() async {
    final result = await _cacheFirstTimer();

    result.fold(
      (failure) => emit(OnBoardingError(failure.errorMessage)),
      (_) => emit(UserCached()),
    );
  }

  Future<void> checkIfUserFirstTimer() async {
    final result = await _checkIfUserFirstTimer();

    result.fold(
      (failure) => emit(OnBoardingStatus(isFirstTimer: true)),
      (status) => emit(OnBoardingStatus(isFirstTimer: status)),
    );
  }
}
