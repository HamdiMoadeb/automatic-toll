import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:tollxpress/core/common/widgets/custom_field.dart';
import 'package:tollxpress/core/common/widgets/gradient_background.dart';
import 'package:tollxpress/core/common/widgets/rounded_button.dart';
import 'package:tollxpress/core/res/media_res.dart';
import 'package:tollxpress/core/utils/core_utils.dart';
import 'package:tollxpress/feature/auth/presentation/manager/bloc/auth_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const routeName = '/forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        )
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is ForgotPasswordSent) {
            Navigator.pop(context);
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
                      'Mot de passe oublié',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Pour réinitialiser votre mot de passe, saisissez l’adresse email que vous utilisez pour vous connecter à votre compte',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: formKey,
                      child: CustomField(
                        controller: emailController,
                        hintText: 'Adresse Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email){
                          if(!CoreUtils.validEmail(email!)){
                            return 'Email non valide';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    state is AuthLoading
                        ? const Center(child: CircularProgressIndicator())
                        : RoundedButton(
                            label: 'Envoyer',
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      ForgotPasswordEvent(
                                        email: emailController.text.trim(),
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
