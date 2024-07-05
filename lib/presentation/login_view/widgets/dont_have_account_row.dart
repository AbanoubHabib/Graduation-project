import 'package:flutter/material.dart';



class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Don\'t Have Account?'),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/SignUp'),
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
