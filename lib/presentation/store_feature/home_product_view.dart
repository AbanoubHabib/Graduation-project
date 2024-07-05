import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/presentation/store_feature/models/item_cart_model.dart';
import 'package:final_project/presentation/store_feature/models/item_info_model.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_state.dart';
import 'package:final_project/presentation/store_feature/cubit/shop_cubit_cubit.dart';

class HomeProductView extends StatelessWidget {
  const HomeProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ShopCubit, ShopCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInUp(
                  delay: const Duration(milliseconds: 500),
                  child: CarouselSlider(
                    items: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 30, right: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/store/sc5.jpg',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 30, right: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/store/sc2.jpg',
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/store/sc23.jpg',
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 250,
                      initialPage: 0,
                      aspectRatio: 1,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomGridViewBuilderCart(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomGridViewBuilderCart extends StatelessWidget {
  const CustomGridViewBuilderCart({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 400),
      child: SizedBox(
        height:
            MediaQuery.of(context).size.height * 1.24, // Specify a fixed height
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: dataItemsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 18.0, // Spacing between columns
            mainAxisSpacing: 18.0, // Spacing between rows
            childAspectRatio: .7, // Aspect ratio of each item
          ),
          itemBuilder: (context, index) {
            return HomeItem(
              item: dataItemsList[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}
