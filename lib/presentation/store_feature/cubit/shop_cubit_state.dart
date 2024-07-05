import 'package:flutter/material.dart';
import 'package:final_project/presentation/store_feature/models/item_info_model.dart';

@immutable
abstract class ShopCubitState {}

class ShopCubitInitialState extends ShopCubitState {}

class ShopChangeBottomNavState extends ShopCubitState {}

class ShopLoadingData extends ShopCubitState {}

class SuccessShopLoadingData extends ShopCubitState {}

class ErrorToShopLoadingData extends ShopCubitState {}

class ShopFavoriteToggledState extends ShopCubitState {}


class ShopCartUpdated extends ShopCubitState {
  final List<ItemInfo> cartItems;

  ShopCartUpdated(this.cartItems);
}
