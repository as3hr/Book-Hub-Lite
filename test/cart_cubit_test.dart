import 'package:book_hub_lite/domain/entities/book_entity.dart';
import 'package:book_hub_lite/navigation/app_navigation.dart';
import 'package:book_hub_lite/presentation/cart/cart_cubit.dart';
import 'package:book_hub_lite/presentation/cart/cart_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeAppNavigation implements AppNavigation {
  @override
  exitApp() {}

  @override
  getToLast() {}

  @override
  pop() {}

  @override
  void push(String routeName, {arguments}) {}

  @override
  pushReplacement(String routeName, {arguments}) {}
}

class FakeCartNavigator extends CartNavigator {
  FakeCartNavigator() : super(FakeAppNavigation());
}

void main() {
  group('CartCubit Tests', () {
    late CartCubit cartCubit;

    setUp(() {
      cartCubit = CartCubit(FakeCartNavigator());
    });

    tearDown(() {
      cartCubit.close();
    });

    test('Initial state should be empty', () {
      expect(cartCubit.state.books, isEmpty);
    });

    test('Adding a book should update the cart', () {
      final book = BookEntity(title: 'Flutter Book', price: 10.0);

      cartCubit.addBookToCart(book);

      expect(cartCubit.state.books, contains(book));
      expect(cartCubit.state.books.length, 1);
    });

    test('Adding multiple books should increase cart size', () {
      final book1 = BookEntity(title: 'Book 1', price: 15.0);
      final book2 = BookEntity(title: 'Book 2', price: 20.0);

      cartCubit.addBookToCart(book1);
      cartCubit.addBookToCart(book2);

      expect(cartCubit.state.books.length, 2);
      expect(cartCubit.state.books.contains(book1), isTrue);
      expect(cartCubit.state.books.contains(book2), isTrue);
    });
  });
}
