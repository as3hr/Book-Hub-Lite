import 'package:book_hub_lite/navigation/route_name.dart';

import '../../../navigation/app_navigation.dart';

class CartNavigator {
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
