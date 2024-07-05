import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_state.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShopCubit, ShopCubitState>(
        builder: (context, state) {
          final shopCubit = ShopCubit.get(context);
          final cartItems = shopCubit.cartItems;

          if (cartItems.isEmpty) {
            return const Center(
              child: Text('No items in the cart yet'),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: SizedBox(
                                height: 50,
                                width: 40,
                                child: Image.asset(
                                  item.imageSrc,
                                  width: 40,
                                  height: 50,
                                  fit: BoxFit.fill,
                                )),
                            title: Text(
                              item.tittleName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //  Text(item.subTittleName,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,),maxLines: 2,),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        shopCubit.decreaseQuantity(item);
                                      },
                                    ),
                                    Text(
                                      item.quantity.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        shopCubit.increaseQuantity(item);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Text(
                              '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                //color: Colors.red,
                                
                              ),
                            ),
                            onTap: item.onTaped,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total :',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xff04658e),
                          ),
                        ),
                        Text(
                          '\$${shopCubit.getTotalPrice().toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff04658e),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 2/100),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/PaymentMethodPage");
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: const Color(0xff04658e),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Go to Payment ',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
