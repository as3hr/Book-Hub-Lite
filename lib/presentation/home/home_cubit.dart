import 'package:bloc/bloc.dart';
import 'package:book_hub_lite/domain/repositories/book_repository.dart';
import 'package:book_hub_lite/helpers/utils.dart';
import 'package:book_hub_lite/presentation/home/home_navigator.dart';
import 'package:book_hub_lite/presentation/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeNavigator navigator;
  final BookRepository bookRepository;
  HomeCubit(this.bookRepository, this.navigator) : super(HomeState.empty());

  Future<void> fetchBooks() async {
    emit(state.copyWith(isLoading: true));
    bookRepository.getBooks().then(
        (response) => response.fold((error) => showToast(error.error), (books) {
              emit(state.copyWith(isLoading: false, books: books));
            }));
  }
}
