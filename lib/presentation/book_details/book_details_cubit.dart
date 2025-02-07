import 'package:bloc/bloc.dart';
import 'package:book_hub_lite/domain/entities/book_entity.dart';
import 'package:book_hub_lite/helpers/utils.dart';
import 'package:book_hub_lite/presentation/book_details/book_details_navigator.dart';
import 'package:book_hub_lite/presentation/book_details/book_details_state.dart';
import 'package:book_hub_lite/presentation/wishlist/wishlist_cubit.dart';

import '../../di/service_locator.dart';

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

  void onAddToWishlistTap() {
    final wishListCubit = sl<WishlistCubit>();
    if (wishListCubit.state.books.contains(params)) {
      wishListCubit.removeBookFromWishlist(params);
      showToast('Book removed from wishlist');
    } else {
      wishListCubit.addBookToWishlist(params);
      showToast('Book added to wishlist');
    }
    emit(state.copyWith(book: params));
  }
}
