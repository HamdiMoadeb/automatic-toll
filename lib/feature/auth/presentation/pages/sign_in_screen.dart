import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollxpress/core/common/app/providers/user_provider.dart';
import 'package:tollxpress/core/common/widgets/gradient_background.dart';
import 'package:tollxpress/core/common/widgets/rounded_button.dart';
import 'package:tollxpress/core/res/fonts.dart';
import 'package:tollxpress/core/res/media_res.dart';
import 'package:tollxpress/core/utils/core_utils.dart';
import 'package:tollxpress/feature/auth/data/models/user_model.dart';
import 'package:tollxpress/feature/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:tollxpress/feature/auth/presentation/pages/forgot_password_screen.dart';
import 'package:tollxpress/feature/auth/presentation/pages/sign_up_screen.dart';
import 'package:tollxpress/feature/auth/presentation/widgets/sign_in_form.dart';
import 'package:tollxpress/feature/home/presentation/pages/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const routeName = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is SignedIn) {
            context.read<UserProvider>().initUser(state.user as UserModel);
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
        },
        builder: (context, state) {
          return GradientBackground(
            image: MediaRes.authGradientBackground,
            child: SafeArea(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const Text(
                      'Routes Fluides,\nPaiements Rapides.',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        fontFamily: Fonts.aeonik,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Connectez-vous à votre compte',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            SignUpScreen.routeName,
                          );
                        },
                        child: const Text('Créer un compte?'),
                      ),
                    ),
                    SignInForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      formKey: formKey,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ForgotPasswordScreen.routeName,
                          );
                        },
                        child: const Text('Mot de passe oublié?'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    state is AuthLoading
                        ? const Center(child: CircularProgressIndicator())
                        : RoundedButton(
                            label: 'Se connecter',
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              //TODO reset current user
                              if (formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      SignInEvent(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                      ),
                                    );
                              }
                            },
                          ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
