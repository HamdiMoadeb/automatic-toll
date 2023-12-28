import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tollxpress/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:tollxpress/feature/auth/data/repositories/auth_repo_impl.dart';
import 'package:tollxpress/feature/auth/domain/repositories/auth_repo.dart';
import 'package:tollxpress/feature/auth/domain/use_cases/forgot_password.dart';
import 'package:tollxpress/feature/auth/domain/use_cases/sign_in.dart';
import 'package:tollxpress/feature/auth/domain/use_cases/sign_up.dart';
import 'package:tollxpress/feature/auth/domain/use_cases/update_user.dart';
import 'package:tollxpress/feature/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:tollxpress/feature/on_boarding/data/data_sources/on_boarding_local_data_source.dart';
import 'package:tollxpress/feature/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:tollxpress/feature/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:tollxpress/feature/on_boarding/domain/use_cases/cache_first_timer.dart';
import 'package:tollxpress/feature/on_boarding/domain/use_cases/check_if_user_first_timer.dart';
import 'package:tollxpress/feature/on_boarding/presentation/manager/cubit/on_boarding_cubit.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  await _onBoardingInit();
  await _authInit();
}

Future<void> _authInit() async {
  serviceLocator
    ..registerFactory(
      () => AuthBloc(
        signIn: serviceLocator(),
        signUp: serviceLocator(),
        updateUser: serviceLocator(),
        forgotPassword: serviceLocator(),
      ),
    )
    ..registerLazySingleton(() => SignIn(serviceLocator()))
    ..registerLazySingleton(() => SignUp(serviceLocator()))
    ..registerLazySingleton(() => UpdateUser(serviceLocator()))
    ..registerLazySingleton(() => ForgotPassword(serviceLocator()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(serviceLocator()))
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(serviceLocator()))
    ..registerLazySingleton(() => http.Client());
}

Future<void> _onBoardingInit() async {
  final prefs = await SharedPreferences.getInstance();

  serviceLocator
    ..registerFactory(
      () => OnBoardingCubit(
        checkIfUserFirstTimer: serviceLocator(),
        cacheFirstTimer: serviceLocator(),
      ),
    )
    ..registerLazySingleton(() => CheckIfUserFirstTimer(serviceLocator()))
    ..registerLazySingleton(() => CacheFirstTimer(serviceLocator()))
    ..registerLazySingleton<OnBoardingRepo>(
        () => OnBoardingRepoImpl(serviceLocator()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
        () => OnBoardingLocalDataSourceImpl(serviceLocator()))
    ..registerLazySingleton(() => prefs);
}
