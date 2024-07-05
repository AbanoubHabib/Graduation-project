import 'package:final_project/presentation/resources/colors_manager.dart';
import 'package:final_project/presentation/resources/fonts_maneger.dart';
import 'package:flutter/material.dart';

import '../data/onboarding_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final OnboardingModel data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
              child: Image.asset(
                data.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Text(
                  data.headline,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: FontSizeManager.s16,
                    fontWeight: FontWeightManager.bold,
                    color: ColorsManager.primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    data.description,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: FontSizeManager.s16,
                      fontWeight: FontWeightManager.semiBold,
                      color: ColorsManager.primaryColorLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
