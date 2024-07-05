import 'package:flutter/material.dart';

import '../../presentation/resources/assets_manager.dart';


class StartView extends StatelessWidget {
  StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              ImageAssets.startImg,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 500,
                  child: const Text(
                    'TripEase',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Myfont",
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                // const SizedBox(
                //   height: 100.0,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Login_or_signup');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      //color: const Color(0xff00ad48),
                      color:const Color(0xff04658E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        "Continue with Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                GestureDetector(
                  onTap: () {
                    //AppRoutes.signup;
                    Navigator.pushNamed(context, '/SignUp');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        "Create an account ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
