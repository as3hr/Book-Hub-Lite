import 'package:book_hub_lite/presentation/cart/components/cart_navigator.dart';

import '../../../di/service_locator.dart';
import '../../cart/cart_cubit.dart';

class CartModule {
  static Future<void> configureCartModuleInjection() async {
    sl.registerLazySingleton<CartNavigator>(() => CartNavigator(sl()));
    sl.registerLazySingleton<CartCubit>(() => CartCubit(sl()));
  }
}
