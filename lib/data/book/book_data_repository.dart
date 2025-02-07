import 'dart:convert';

import 'package:book_hub_lite/helpers/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:book_hub_lite/domain/entities/book_entity.dart';
import 'package:book_hub_lite/domain/failures/book_failure.dart';
import 'package:book_hub_lite/data/model/book_json.dart';
import 'package:book_hub_lite/domain/repositories/book_repository.dart';
import 'package:book_hub_lite/helpers/utils.dart';
import 'package:flutter/services.dart';

class BookDataRepository implements BookRepository {
  BookDataRepository();

  @override
  Future<Either<BookFailure, List<BookEntity>>> getBooks() async {
    try {
      final response = await rootBundle.loadString(dataDir);
      final data = jsonDecode(response);
      final books = parseList(data["books"], BookJson.fromJson)
          .map((book) => book.toDomain())
          .cast<BookEntity>()
          .toList();
      return right(books);
    } catch (error) {
      return Left(BookFailure(error: "Unable to Fetch Books Data!"));
    }
  }
}
