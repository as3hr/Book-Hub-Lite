import 'package:book_hub_lite/presentation/book_details/book_details_navigator.dart';
import 'package:book_hub_lite/presentation/cart/cart_navigator.dart';

import '../../navigation/app_navigation.dart';

class HomeNavigator with BookDetailRoute, CartROute {
  @override
  final AppNavigation navigation;
  HomeNavigator(this.navigation);
}

mixin HomeRoute {
  AppNavigation get navigation;
}
