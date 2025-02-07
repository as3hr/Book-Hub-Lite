// ignore_for_file: unused_local_variable

import 'package:book_hub_lite/navigation/route_name.dart';
import 'package:book_hub_lite/presentation/bottom_bar/bottom_bar.dart';
import 'package:book_hub_lite/presentation/on_boarding/on_boarding_screen.dart';
import 'package:book_hub_lite/presentation/read_book/read_book_screen.dart';
import 'package:flutter/material.dart';

import '../di/service_locator.dart';
import '../presentation/book_details/book_details_screen.dart';
import '../presentation/home/home_screen.dart';

enum TransitionType {
  fade,
  slide,
}

Route<dynamic> generateRoute(RouteSettings settings) {
  final args =
      (settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;

  switch (settings.name) {
    case RouteName.splash:
      return getRoute(const OnboardingScreen(), TransitionType.fade);

    case RouteName.bottomBar:
      return getRoute(BottomBar(cubit: sl()), TransitionType.fade);

    case RouteName.home:
      return getRoute(const HomeScreen(), TransitionType.fade);

    case RouteName.bookDetails:
      return getRoute(
        BookDetailsScreen(
          cubit: sl(
            param1: args["book"],
          ),
        ),
        TransitionType.slide,
      );

    case RouteName.bookReader:
      return getRoute(
          ReadBookScreen(
            cubit: sl(
              param1: args["book"],
            ),
          ),
          TransitionType.fade);

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('PAGE NOT FOUND!!')),
        ),
      );
  }
}

PageRouteBuilder getRoute(Widget page, TransitionType transitionType) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (transitionType) {
        case TransitionType.fade:
          return FadeTransition(opacity: animation, child: child);
        case TransitionType.slide:
          const begin = Offset(1, 0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
      }
    },
  );
}
