import 'package:bloc/bloc.dart';
import 'package:book_hub_lite/domain/entities/book_entity.dart';
import 'package:book_hub_lite/presentation/book_details/book_details_navigator.dart';
import 'package:book_hub_lite/presentation/book_details/book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  final BookEntity params;
  final BookDetailNavigator navigator;
  BookDetailsCubit(this.params, this.navigator)
      : super(BookDetailsState.empty()) {
    setBookDetails();
  }

  void setBookDetails() {
    emit(state.copyWith(book: params));
  }
}
