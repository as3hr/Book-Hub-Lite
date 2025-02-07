import 'package:dartz/dartz.dart';
import 'package:book_hub_lite/domain/entities/book_entity.dart';
import 'package:book_hub_lite/domain/failures/book_failure.dart';

abstract class BookRepository {
  Future<Either<BookFailure, List<BookEntity>>> getBooks();
}
