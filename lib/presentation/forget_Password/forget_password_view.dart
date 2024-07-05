import 'app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:final_project/presentation/resources/colors_manager.dart';
import 'package:final_project/presentation/onboarding/model/app_defaults.dart';


class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Forget Password',style: TextStyle(color: Colors.white),),
        backgroundColor:const Color(0xff04658e),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(AppDefaults.margin),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDefaults.padding,
                  vertical: AppDefaults.padding * 3,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppDefaults.borderRadius,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Reset your password',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: AppDefaults.padding),
                    Text(
                      'Please enter your email address. We will send a massage\non your phone to reset your password.',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppDefaults.padding * 3),
                    const Text(
                      "Email Address",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: AppDefaults.padding),
                    const SizedBox(height: AppDefaults.padding),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xff08638f),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
