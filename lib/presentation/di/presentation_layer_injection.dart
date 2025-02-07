import 'package:book_hub_lite/presentation/di/module/book_detail_module.dart';
import 'package:book_hub_lite/presentation/di/module/home_module.dart';
import 'package:book_hub_lite/presentation/di/module/read_book_module.dart';
import 'package:book_hub_lite/presentation/di/module/wishlist_module.dart';

import 'module/bottom_bar_module.dart';

class PresentationLayerInjection {
  static Future<void> configurePresentationLayerInjection() async {
    await BottomBarModule.configureBottomBarModuleInjection();
    await HomeModule.configureHomeModuleInjection();
    await BookDetailModule.configureBookDetailModuleInjection();
    await WishListModule.configureWishListModuleInjection();
    await ReadBookModule.configureReadBookModuleInjection();
  }
}
