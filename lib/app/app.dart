import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/presentation/chat/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/presentation/resources/routes_manager.dart';
import 'package:final_project/profile/payment_method/cubit/card_cubit.dart';
import 'package:final_project/presentation/resources/themes_app_manager.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_cubit.dart';

class TripEase extends StatefulWidget {
//named Constructor
  TripEase._internal();

  static final TripEase instance = TripEase._internal();

  factory TripEase() => instance;

  @override
  State<TripEase> createState() => _TripEaseState();
}

class _TripEaseState extends State<TripEase> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return ShopCubit();
        }),
        BlocProvider(create: (context) => CardCubit()),
        BlocProvider(
            create: (context) => ChatCubit(FirebaseFirestore.instance)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getAppLicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.SplashView,
      ),
    );
  }
}

///////////Note View////////
