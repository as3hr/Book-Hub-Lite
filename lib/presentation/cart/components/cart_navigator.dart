import 'package:book_hub_lite/navigation/route_name.dart';
import 'package:book_hub_lite/presentation/book_details/book_details_navigator.dart';

import '../../../navigation/app_navigation.dart';

class CartNavigator with BookDetailRoute {
  @override
  final AppNavigation navigation;
  CartNavigator(this.navigation);

  void openCheckOut() {
    navigation.push(RouteName.checkout);
  }

  void openOrderSuccess(double amount) {
    navigation.push(RouteName.successOrder, arguments: {"amount": amount});
  }

  void backToHome() {
    navigation.getToLast();
  }
}

mixin CartROute {
  AppNavigation get navigation;

  navigateToCart() {
    navigation.push(RouteName.cart);
  }
}
