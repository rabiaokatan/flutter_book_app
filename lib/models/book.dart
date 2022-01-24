final String tableBooks = 'books';

//for database columns exc.
class BookFields {
  static final List<String> values = [id, bookName, author, pageNumber, time];

  static const String id = '_id';
  static const String bookName = 'bookName';
  static const String author = 'author';
  static const String pageNumber = 'pageNumber';
  static const String time = 'time';
}

//
class Book {
  final int? id;
  final String bookName;
  final String author;
  final int pageNumber;
  final String time;

  Book({
    this.id,
    required this.bookName,
    required this.author,
    required this.pageNumber,
    required this.time,
  });

  Book copy({
    int? id,
    String? bookName,
    String? author,
    int? pageNumber,
    String? time,
  }) =>
      Book(
        id: id ?? this.id,
        bookName: bookName ?? this.bookName,
        author: author ?? this.author,
        pageNumber: pageNumber ?? this.pageNumber,
        time: time ?? this.time,
      );

  static Book fromJson(Map<String, Object?> json) => Book(
        id: json[BookFields.id] as int?,
        bookName: json[BookFields.bookName] as String,
        author: json[BookFields.author] as String,
        pageNumber: json[BookFields.pageNumber] as int,
        time: json[BookFields.time] as String,
      );

  Map<String, Object?> toJson() => {
        BookFields.id: id,
        BookFields.bookName: bookName,
        BookFields.author: author,
        BookFields.pageNumber: pageNumber,
        BookFields.time: time,
      };
}
