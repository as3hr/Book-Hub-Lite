import 'package:book_hub_lite/presentation/on_boarding/on_boarding_navigator.dart';
import 'package:book_hub_lite/presentation/on_boarding/on_boarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final OnBoardingNavigator navigator;
  OnBoardingCubit(this.navigator) : super(OnBoardingState.empty());

  void onGetInPressed() {
    navigator.goToBottomBar();
  }
}
