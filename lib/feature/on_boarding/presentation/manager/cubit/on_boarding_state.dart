part of 'on_boarding_cubit.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnBoardingInitial extends OnBoardingState {
  OnBoardingInitial();
}

class CachingFirstTimer extends OnBoardingState {
  CachingFirstTimer();
}

class CheckingIfUserFirstTimer extends OnBoardingState {
  CheckingIfUserFirstTimer();
}

class UserCached extends OnBoardingState {
  UserCached();
}

class OnBoardingStatus extends OnBoardingState {
  OnBoardingStatus({required this.isFirstTimer});

  final bool isFirstTimer;

  @override
  List<bool> get props => [isFirstTimer];
}

class OnBoardingError extends OnBoardingState {
  OnBoardingError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
