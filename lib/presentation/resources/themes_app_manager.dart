import 'package:final_project/presentation/resources/fonts_maneger.dart';
import 'package:final_project/presentation/resources/colors_manager.dart';
import 'package:final_project/presentation/resources/defaults_values_manager.dart';
import 'package:final_project/presentation/resources/font_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getAppLicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorsManager.primaryColor,
    primaryColorLight: ColorsManager.primaryColorLight,
    primaryColorDark: ColorsManager.primaryColorDark,
    disabledColor: ColorsManager.grey,
    //ripple effect color
    splashColor: ColorsManager.primaryColorLight,

    //card theme
    cardTheme: const CardTheme(
      color: ColorsManager.cardColor,
      shadowColor: ColorsManager.grey,
      elevation: AppSize.s4,
    ),
    appBarTheme: const AppBarTheme(
      elevation: AppSize.s4,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        fontSize: FontSizeManager.s18,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    ),

    //button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorsManager.grey,
      buttonColor: ColorsManager.primaryColor,
      splashColor: ColorsManager.primaryColorLight,
    ),

    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(AppDefaults.padding),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDefaults.borderRadius,
        ),
        textStyle: getRegularStyle(
          fontSize: FontSizeManager.s18,
          color: ColorsManager.white,
        ),
      ),
    ),

    //text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: ColorsManager.black,
        fontSize: FontSizeManager.s24,
      ),
      bodyLarge:
          TextStyle(color: ColorsManager.black, fontSize: FontSizeManager.s18),
      titleLarge: TextStyle(
          color: ColorsManager.placeholder, fontSize: FontSizeManager.s16),
      titleMedium: TextStyle(
          color: ColorsManager.placeholder, fontSize: FontSizeManager.s14),
      titleSmall: TextStyle(
          color: ColorsManager.placeholder, fontSize: FontSizeManager.s12),
      bodyMedium:
          TextStyle(color: ColorsManager.black, fontSize: FontSizeManager.s12),
    ),
    
      // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorsManager.grey, fontSize: FontSizeManager.s14),
        labelStyle:
            getMediumStyle(color: ColorsManager.grey, fontSize: FontSizeManager.s14),
        errorStyle: getRegularStyle(color: ColorsManager.error),

        // enabled border style
        enabledBorder:const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.grey, width: AppSize.s1_5),
            borderRadius:  BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder:const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.primaryColor, width: AppSize.s1_5),
            borderRadius:  BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.error, width: AppSize.s1_5),
            borderRadius:  BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder:const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.primaryColor, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(AppDefaults.padding),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDefaults.borderRadius,
        ),
        textStyle: const TextStyle(fontWeight: FontWeightManager.bold),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeightManager.semiBold,
          fontFamily: 'Montserrat',
        ),
      ),
    ),
  );
  
}

////////old theme ////////////////

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      colorSchemeSeed: ColorsManager.primaryColor,
      fontFamily: 'Montserrat',
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: ColorsManager.placeholder),
        bodyMedium: TextStyle(color: ColorsManager.placeholder),
      ),
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      inputDecorationTheme: defaultInputDecorationTheme,
      sliderTheme: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
        thumbColor: Colors.white,
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: ColorsManager.primaryColor,
        unselectedLabelColor: ColorsManager.placeholder,
        labelPadding: EdgeInsets.all(AppDefaults.padding),
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsManager.primaryColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsManager.placeholder,
        ),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: ColorsManager.primaryColor,
            width: 5,
          ),
        ),
      ),
    );
  }

  /* <---- Input Decorations Theme -----> */
  static const defaultInputDecorationTheme = InputDecorationTheme(
    fillColor: ColorsManager.textInputBackground,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    suffixIconColor: ColorsManager.placeholder,
  );

  static const secondaryInputDecorationTheme = InputDecorationTheme(
    fillColor: ColorsManager.textInputBackground,
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
  );

  static final otpInputDecorationTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 2),
      borderRadius: BorderRadius.circular(25),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2),
      borderRadius: BorderRadius.circular(25),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2),
      borderRadius: BorderRadius.circular(25),
    ),
  );
}
