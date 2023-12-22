


import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tollxpress/feature/on_boarding/data/data_sources/on_boarding_local_data_source.dart';
import 'package:tollxpress/feature/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:tollxpress/feature/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:tollxpress/feature/on_boarding/domain/use_cases/cache_first_timer.dart';
import 'package:tollxpress/feature/on_boarding/domain/use_cases/check_if_user_first_timer.dart';
import 'package:tollxpress/feature/on_boarding/presentation/manager/cubit/on_boarding_cubit.dart';


final serviceLocator = GetIt.instance;

Future<void> init() async {

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
    ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(serviceLocator()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(() => OnBoardingLocalDataSourceImpl(serviceLocator()))
    ..registerLazySingleton(() => prefs);
}
