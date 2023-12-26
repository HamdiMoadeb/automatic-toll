import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tollxpress/core/common/widgets/custom_field.dart';
import 'package:tollxpress/core/utils/core_utils.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm(
      {required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.fullNameController,
      required this.formKey,
      super.key});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController fullNameController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignUpForm> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomField(
            controller: widget.fullNameController,
            hintText: 'Nom et prénom',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 25),
          CustomField(
            controller: widget.emailController,
            hintText: 'Adresse Email',
            keyboardType: TextInputType.emailAddress,
            validator: (email){
              if(!CoreUtils.validEmail(email!)){
                return 'Email non valide';
              }
              return null;
            },
          ),
          const SizedBox(height: 25),
          CustomField(
            controller: widget.passwordController,
            hintText: 'Mot de passe',
            obscureText: obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              icon: Icon(
                obscurePassword ? IconlyLight.show : IconlyLight.hide,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 25),
          CustomField(
            controller: widget.confirmPasswordController,
            hintText: 'Confirmer mot de passe',
            obscureText: obscureConfirmPassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              icon: Icon(
                obscureConfirmPassword ? IconlyLight.show : IconlyLight.hide,
                color: Colors.grey,
              ),
            ),
            validator: (value){
              if(value != widget.passwordController.text){
                return 'Mots de passe ne correspondent pas';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
