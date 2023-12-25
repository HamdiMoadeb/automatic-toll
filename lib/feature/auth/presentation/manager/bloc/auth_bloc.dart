import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tollxpress/core/enums/update_user.dart';
import 'package:tollxpress/feature/auth/domain/entities/user.dart';
import 'package:tollxpress/feature/auth/domain/use_cases/forgot_password.dart';
import 'package:tollxpress/feature/auth/domain/use_cases/sign_in.dart';
import 'package:tollxpress/feature/auth/domain/use_cases/sign_up.dart';
import 'package:tollxpress/feature/auth/domain/use_cases/update_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn _signIn;
  final SignUp _signUp;
  final UpdateUser _updateUser;
  final ForgotPassword _forgotPassword;

  AuthBloc({
    required SignIn signIn,
    required SignUp signUp,
    required UpdateUser updateUser,
    required ForgotPassword forgotPassword,
  })  : _signIn = signIn,
        _signUp = signUp,
        _updateUser = updateUser,
        _forgotPassword = forgotPassword,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(const AuthLoading());
    });
    on<SignInEvent>(_signInEventHandler);
    on<SignUpEvent>(_signUpEventHandler);
    on<ForgotPasswordEvent>(_forgotPasswordEventHandler);
    on<UpdateUserEvent>(_updateUserEventHandler);
  }

  Future<void> _signInEventHandler(
      SignInEvent event, Emitter<AuthState> emit) async {
    final result = await _signIn
        .call(SignInParams(email: event.email, password: event.password));

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (user) => emit(SignedIn(user)),
    );
  }

  Future<void> _signUpEventHandler(
      SignUpEvent event, Emitter<AuthState> emit) async {
    final result = await _signUp.call(SignUpParams(
      email: event.email,
      password: event.password,
      fullName: event.fullName,
    ));

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(const SignedUp()),
    );
  }

  Future<void> _forgotPasswordEventHandler(
      ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    final result = await _forgotPassword.call(event.email);

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(const ForgotPasswordSent()),
    );
  }

  Future<void> _updateUserEventHandler(
      UpdateUserEvent event, Emitter<AuthState> emit) async {
    final result = await _updateUser
        .call(UpdateUserParams(userData: event.userData, action: event.action));

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(const UserUpdated()),
    );
  }
}
