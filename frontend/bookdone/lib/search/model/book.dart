class Book {
  String title;
  // String author;
  // String isbn;
  // String publisher;

  Book({
    required this.title,
    // required this.author,
    // required this.isbn,
    // required this.publisher,
  });

  factory Book.fromJson(Map<String, dynamic> volumeInfo) {
    return Book(
      // title이 없는 경우 빈 문자열 할당
      title: volumeInfo["title"] ?? "",
      // author: volumeInfo["author"] ?? "",
      // isbn: volumeInfo["isbn"] ?? "",
      // publisher: volumeInfo["publisher"] ?? "",
    );
  }
}
