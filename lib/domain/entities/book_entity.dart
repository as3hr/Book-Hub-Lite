class BookEntity {
  final String? title;
  final String? author;
  final String? image;
  final String? aboutAuthor;
  final String? overview;
  final String? bookText;
  final double? price;

  BookEntity({
    this.title,
    this.author,
    this.image,
    this.aboutAuthor,
    this.overview,
    this.bookText,
    this.price,
  });

  BookEntity.empty()
      : title = "",
        author = "",
        image = "",
        aboutAuthor = "",
        overview = "",
        bookText = "",
        price = 0.0;
}
