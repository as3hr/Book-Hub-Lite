import 'package:book_hub_lite/helpers/styles/app_color.dart';
import 'package:book_hub_lite/helpers/styles/app_images.dart';
import 'package:book_hub_lite/presentation/cart/cart_cubit.dart';

import '../../../di/service_locator.dart';
import '../../cart/cart_state.dart';
import 'bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bottom_bar_cubit.dart';
import '../bottom_bar_state.dart';

class BottomBarIcon extends StatelessWidget {
  const BottomBarIcon({
    super.key,
    required this.item,
    required this.index,
    required this.cubit,
  });
  final BottomBarItem item;
  final int index;
  final BottomBarCubit cubit;

  static final cartCubit = sl<CartCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
        bloc: cubit,
        builder: (context, state) {
          bool isSelected = state.currentIndex == index;
          return GestureDetector(
              onTap: () => cubit.updateIndex(index),
              child: index == 1
                  ? BlocBuilder<CartCubit, CartState>(
                      bloc: cartCubit,
                      builder: (context, state) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              item.image,
                              width: 24,
                              color:
                                  isSelected ? AppColor.primary : Colors.grey,
                            ),
                            if (state.books.isNotEmpty)
                              Positioned(
                                right: -5,
                                top: -10,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: AppColor.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    state.books.length.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    )
                  : (index == 2 && isSelected)
                      ? Image.asset(
                          AppImages.bookmark2,
                        )
                      : Image.asset(
                          item.image,
                          color: isSelected ? AppColor.primary : Colors.grey,
                        ));
        });
  }
}
