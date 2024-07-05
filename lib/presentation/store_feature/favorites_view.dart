import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/presentation/store_feature/models/item_info_model.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_state.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShopCubit, ShopCubitState>(
        builder: (context, state) {
          final shopCubit = ShopCubit.get(context);
          final favoriteItems = shopCubit.getFavoriteItems(
              dataItemsList); // Assuming `dataItemsList` is accessible here

          if (favoriteItems.isEmpty) {
            return const Center(
              child: Text('No favorite items yet'),
            );
          }

          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final item = favoriteItems[index];
              return ListTile(
                leading: SizedBox(
                  height: 40,
                  width: 50,
                  child: Image.asset(
                    item.imageSrc,
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  item.tittleName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  item.subTittleName,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                ),
                trailing: Text('\$${item.price.toString()}'),
                onTap: item.onTaped,
              );
            },
          );
        },
      ),
    );
  }
}
