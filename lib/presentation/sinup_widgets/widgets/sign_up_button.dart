import 'package:final_project/presentation/onboarding/model/app_defaults.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpButton({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  Future<void> signUp(BuildContext context) async {
    final String inputName = nameController.text.trim();
    final String inputEmail = emailController.text.trim();
    final String inputPassword = passwordController.text.trim();

    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: inputEmail,
        password: inputPassword,
      );

      User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': inputName,
          'email': inputEmail,
        });
        // Show success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Signup Successful'),
              content: Text('Signup successful! You can now log in.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.pushNamed(context, '/Login'); // Navigate to login screen
                  },
                ),
              ],
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'The email address is already in use!';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid!';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email/password accounts are not enabled!';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak!';
          break;
        default:
          errorMessage = 'Signup failed. Please try again.';
          break;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDefaults.padding * 2),
      child: Row(
        children: [
          Text(
            'Sign Up',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              signUp(context);
            },
            style: ElevatedButton.styleFrom(
              elevation: 1,
              backgroundColor: const Color(0xff04658e),
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}