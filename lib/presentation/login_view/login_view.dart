import 'package:final_project/presentation/login_view/widgets/dont_have_account_row.dart';
import 'package:final_project/presentation/login_view/widgets/login_button.dart';
import 'package:final_project/presentation/login_view/widgets/login_header.dart';
import 'package:final_project/presentation/login_view/widgets/login_page_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLoginPressed(BuildContext context) async {
    final String inputEmail = emailController.text.trim();
    final String inputPassword = passwordController.text.trim();
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: inputEmail,
        password: inputPassword,
      );

      User? user = userCredential.user;
      if (user != null) {
        Navigator.pushNamed(context, '/home');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid!';
          break;
        default:
          errorMessage = 'Login failed. Please try again.';
          break;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginPageHeader(),
                  LoginPageForm(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  SizedBox(height: 50),
                  LoginButton(onPressed: () => _onLoginPressed(context)),
                  DontHaveAccountRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
