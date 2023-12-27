import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tollxpress/core/common/app/providers/user_provider.dart';
import 'package:tollxpress/core/common/views/page_under_construction.dart';
import 'package:tollxpress/feature/auth/data/models/user_model.dart';
import 'package:tollxpress/feature/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:tollxpress/feature/auth/presentation/pages/forgot_password_screen.dart';
import 'package:tollxpress/feature/auth/presentation/pages/sign_in_screen.dart';
import 'package:tollxpress/feature/auth/presentation/pages/sign_up_screen.dart';
import 'package:tollxpress/feature/home/presentation/pages/home_screen.dart';
import 'package:tollxpress/feature/on_boarding/data/data_sources/on_boarding_local_data_source.dart';
import 'package:tollxpress/feature/on_boarding/presentation/manager/cubit/on_boarding_cubit.dart';
import 'package:tollxpress/feature/on_boarding/presentation/pages/on_boarding_screen.dart';

import 'injection_container.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final prefs = serviceLocator<SharedPreferences>();
      return _pageBuilder((context) {
        if (prefs.getBool(kFirstTimeKey) ?? true) {
          return BlocProvider<OnBoardingCubit>(
            create: (_) => serviceLocator<OnBoardingCubit>(),
            child: const OnBoardingScreen(),
          );
        }
        //TODO check if user connected
        // else if(checkIfUserConnected()){
        //     const user = UserModel(uid: "uid", email: "email", fullName: "fullName", profilePic: "");
        //     context.read<UserProvider>().initUser(user);
        //     return const HomeScreen();
        // }
        // return BlocProvider<AuthBloc>(
        //   create: (_) => serviceLocator<AuthBloc>(),
        //   child: const SignInScreen(),
        // );
        const user = UserModel(
          uid: "uid",
          email: "hamdimoadeb@gmail.com",
          fullName: "Hamdi Moadeb",
          profilePic: "",
        );
        context.read<UserProvider>().initUser(user);
        return const HomeScreen();
      }, settings: settings);
    case SignInScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider<AuthBloc>(
          create: (_) => serviceLocator<AuthBloc>(),
          child: const SignInScreen(),
        ),
        settings: settings,
      );
    case SignUpScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider<AuthBloc>(
          create: (_) => serviceLocator<AuthBloc>(),
          child: const SignUpScreen(),
        ),
        settings: settings,
      );
    case HomeScreen.routeName:
      return _pageBuilder(
        (_) => const HomeScreen(),
        settings: settings,
      );
    case ForgotPasswordScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider<AuthBloc>(
          create: (_) => serviceLocator<AuthBloc>(),
          child: const ForgotPasswordScreen(),
        ),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder _pageBuilder(Widget Function(BuildContext) page,
    {required RouteSettings settings}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
