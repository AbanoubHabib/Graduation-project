import 'package:final_project/presentation/sinup_widgets/widgets/sign_up_form.dart';
import 'package:final_project/presentation/sinup_widgets/widgets/sign_up_page_header.dart';
import 'package:flutter/material.dart';
import '../onboarding/model/app_defaults.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignUpPageHeader(),
                SizedBox(height: AppDefaults.padding),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
