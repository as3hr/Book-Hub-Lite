import 'package:book_hub_lite/presentation/home/home_cubit.dart';
import 'package:book_hub_lite/presentation/home/home_navigator.dart';

import '../../../di/service_locator.dart';

class HomeModule {
  static Future<void> configureHomeModuleInjection() async {
    sl.registerSingleton<HomeNavigator>(HomeNavigator(sl()));
    sl.registerSingleton<HomeCubit>(
      HomeCubit(sl(), sl())..fetchBooks(),
    );
  }
}
