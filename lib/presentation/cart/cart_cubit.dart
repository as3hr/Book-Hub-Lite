import 'package:book_hub_lite/domain/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';
import 'components/cart_navigator.dart';

class CartCubit extends Cubit<CartState> {
  final CartNavigator cartNavigator;
  CartCubit(this.cartNavigator) : super(CartState.empty());

  void addBookToCart(BookEntity book) {
    state.books.insert(0, book);
    emit(state.copyWith(books: state.books));
  }

  void removeBookFromCart(BookEntity book) {
    state.books.remove(book);
    emit(state.copyWith(books: state.books));
  }

  void clearCart() {
    emit(CartState.empty());
  }

  int get cartItemCount => state.books.length;

  double get totalPrice =>
      state.books.fold(0.0, (sum, book) => sum + (book.price ?? 0.0));
}
