import 'package:flutter/material.dart';
import 'package:book_hub_lite/di/service_locator.dart';

import 'presentation/book_hub_lite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.configureServiceLocator();
  runApp(const BookHubLite());
}
