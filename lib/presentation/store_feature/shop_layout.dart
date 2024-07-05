import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/presentation/store_feature/cart_screen.dart';
import 'package:final_project/presentation/store_feature/favorites_view.dart';
import 'package:final_project/presentation/store_feature/home_product_view.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_state.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_cubit.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopCubitState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xff04658e),
                bottom: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 5.0,
                      color: Colors.grey,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 36.0),
                  ),
                  tabs: [
                    Tab(
                      icon: Icon(Icons.home, color: Colors.white, size: 28),
                    ),
                    Tab(
                      icon: Icon(Icons.favorite, color: Colors.white, size: 28),
                    ),
                    Tab(
                      icon: Icon(Icons.shopping_bag,
                          color: Colors.white, size: 28),
                    ),
                  ],
                ),
              ),
            ),
            body: BlocConsumer<ShopCubit, ShopCubitState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return const TabBarView(
                  children: [
                    HomeProductView(),
                    FavoritesScreen(),
                    CartScreen(),
                  ],
                );
              },
            ),
          ),
        );
      },
      listener: (context, State) {},
    );
  }
}
