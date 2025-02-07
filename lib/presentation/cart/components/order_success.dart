import 'package:book_hub_lite/di/service_locator.dart';
import 'package:book_hub_lite/helpers/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../helpers/styles/app_color.dart';
import '../cart_cubit.dart';

class OrderSuccessScreen extends StatelessWidget {
  final double amount;

  const OrderSuccessScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppImages.success, width: 150, height: 150),
              const SizedBox(height: 20),
              const Text(
                "Order Placed Successfully!",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              const SizedBox(height: 10),
              Text(
                "Total Amount: \$${amount.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  sl<CartCubit>().cartNavigator.backToHome();
                },
                child: const Text(
                  "Back to Home",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
