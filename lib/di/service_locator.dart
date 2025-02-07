import 'package:book_hub_lite/domain/di/domain_layer_injection.dart';
import 'package:book_hub_lite/navigation/di/navigation_layer_injection.dart';
import 'package:book_hub_lite/presentation/di/presentation_layer_injection.dart';
import 'package:get_it/get_it.dart';
import '../data/di/data_layer_injection.dart';
import '../service/di/service_injection.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> configureServiceLocator() async {
    await NavigationLayerInjection.configureNavigationLayerInjection();
    await ServiceInjection.configureServiceLayerInjction();
    await DataLayerInjection.configureDataLayerInjction();
    await DomainLayerInjection.configureDataLayerInjection();
    await PresentationLayerInjection.configurePresentationLayerInjection();
  }
}
