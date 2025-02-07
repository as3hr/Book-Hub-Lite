import 'package:book_hub_lite/domain/entities/book_entity.dart';
import 'package:book_hub_lite/presentation/wishlist/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistState.empty());

  void addBookToWishlist(BookEntity book) {
    state.books.insert(0, book);
    emit(state.copyWith(books: state.books));
  }

  void removeBookFromWishlist(BookEntity book) {
    state.books.remove(book);
    emit(state.copyWith(books: state.books));
  }
}
