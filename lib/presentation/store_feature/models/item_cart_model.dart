import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/presentation/store_feature/models/item_info_model.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_state.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_cubit.dart';

class HomeItem extends StatelessWidget {
  final ItemInfo item;
  final int index;
  const HomeItem({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopCubitState>(
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        bool isInCart =
            cubit.cartItems.any((cartItem) => cartItem.id == item.id);
        bool isFavorite = cubit.favoriteItems.contains(item.id);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: item.bgColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.0),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    item.imageSrc,
                    fit: BoxFit.scaleDown,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.tittleName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[600]!.withOpacity(0.2),
                          child: IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              cubit.toggleFavorite(item.id!);
                            },
                          )),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey[600]!.withOpacity(0.2),
                        child: IconButton(
                          onPressed: () {
                            cubit.addItemToCart(item);
                          },
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            size: 25,
                            color: isInCart ? Colors.blue: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
