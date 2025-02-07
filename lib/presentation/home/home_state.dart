import '../../domain/entities/book_entity.dart';

class HomeState {
  bool isLoading;
  List<BookEntity> books;

  HomeState({
    this.isLoading = true,
    required this.books,
  });

  factory HomeState.empty() => HomeState(books: []);

  copyWith({bool? isLoading, List<BookEntity>? books}) => HomeState(
        books: books ?? this.books,
        isLoading: isLoading ?? this.isLoading,
      );
}
