import 'package:final_project/presentation/resources/themes_app_manager.dart';
import 'package:final_project/base/validators.dart';
import 'package:flutter/material.dart';

class LoginPageForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginPageForm({
    Key? key, required this.emailController, required this.passwordController,
  }) : super(key: key);

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final _key = GlobalKey<FormState>();

  bool isPasswordShown = false;
  onPassShowClicked() {
    isPasswordShown = !isPasswordShown;
    setState(() {});
  }

  onLogin() {
    final bool isFormOkay = _key.currentState?.validate() ?? false;
    if (isFormOkay) {
      Navigator.pushNamed(context, '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.defaultTheme.copyWith(
        inputDecorationTheme: AppTheme.secondaryInputDecorationTheme,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Phone Field
              const Text(
                "Email",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: widget.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.requiredWithFieldName('Email'),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  filled: true,
                  //fillColor: Colors.grey[300],
                  fillColor: const Color.fromARGB(255, 207, 209, 222),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Password Field
              const Text(
                "Password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: widget.passwordController,
                validator: Validators.password,
                onFieldSubmitted: (v) => onLogin(),
                textInputAction: TextInputAction.done,
                obscureText: !isPasswordShown,
                decoration: InputDecoration(
                  filled: true,
                  //fillColor: Colors.grey[200],
                  fillColor: const Color.fromARGB(255, 207, 209, 222),

                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  //remove the line under the password when write it
                  //border: InputBorder.none,
                  //chatgpt
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: onPassShowClicked,
                      icon: Icon(
                        isPasswordShown
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ),

              //* Forget Password labelLarge
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forget_password');
                  },
                  child: const Text('Forget Password?'),
                ),
              ),

              // Login labelLarge
              //LoginButton(onPressed: onLogin),
            ],
          ),
        ),
      ),
    );
  }
}
