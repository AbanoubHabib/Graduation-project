import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/presentation/store_feature/models/item_info_model.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_state.dart';


class ShopCubit extends Cubit<ShopCubitState> {
  ShopCubit() : super(ShopCubitInitialState());

  static ShopCubit get(context) => BlocProvider.of<ShopCubit>(context);
  int currentIndex = 0;
  Set<int> favoriteItems = {};
  List<ItemInfo> cartItems = [];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  void toggleFavorite(int itemId) {
    if (favoriteItems.contains(itemId)) {
      favoriteItems.remove(itemId);
    } else {
      favoriteItems.add(itemId);
      print(favoriteItems.length);
    }
    emit(ShopFavoriteToggledState());
  }

  List<ItemInfo> getFavoriteItems(List<ItemInfo> allItems) {
    return allItems.where((item) => favoriteItems.contains(item.id)).toList();
  }

  

  void addItemToCart(ItemInfo item) {
    final existingItem = cartItems.firstWhere(
      (cartItem) => cartItem.id == item.id,
      orElse: () => item,
    );

    if (existingItem.quantity == 1) {
      cartItems.add(item);
    } else {
      existingItem.quantity += 1;
    }
    emit(ShopCartUpdated(cartItems));
  }

  void increaseQuantity(ItemInfo item) {
    item.quantity += 1;
    emit(ShopCartUpdated(cartItems));
  }

  void decreaseQuantity(ItemInfo item) {
    if (item.quantity > 1) {
      item.quantity -= 1;
    } else {
      cartItems.remove(item);
    }
    emit(ShopCartUpdated(cartItems));
  }

  double getTotalPrice() {
    return cartItems.fold(
        0.0, (total, item) => total + (item.price * item.quantity));
  }

  void getLoadingData() {
    emit(ShopLoadingData());
  }
}
