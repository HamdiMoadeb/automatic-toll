import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tollxpress/core/common/widgets/custom_field.dart';
import 'package:tollxpress/core/utils/core_utils.dart';

class SignInForm extends StatefulWidget {
  const SignInForm(
      {required this.emailController,
      required this.passwordController,
      required this.formKey,
      super.key});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
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
              onPressed: (){
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

        ],
      ),
    );
  }
}
