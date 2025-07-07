import 'package:equatable/equatable.dart';

class BookmarkEntity extends Equatable{
  final String  bookmarkId;
  final String bookmarkURL;
  final String? bookmarkText;
  final DateTime? bookmarkCreationDate;
  final String source;

  const BookmarkEntity({
    required this.bookmarkId,
    required this.bookmarkURL,
    required this.bookmarkText,
    required this.bookmarkCreationDate,
    required this.source,
  });

  Map<String, Object?> toDocument(){
    return{
      'bookmarkId': bookmarkId,
      'bookmarkURL': bookmarkURL,
      'bookmarkText': bookmarkText,
      'bookmarkCreationDate': bookmarkCreationDate,
      'source': source,
    };
  }

   static BookmarkEntity fromDocument(Map<String, dynamic> doc){
    return BookmarkEntity(
      bookmarkId: doc['bookmarkId'],
      bookmarkURL: doc['bookmarkURL'],
      bookmarkText: doc['bookmarkText'],
      bookmarkCreationDate: doc['bookmarkCreationDate'],
      source: doc['source'],
      );
   }

  @override
  List<Object?> get props => [bookmarkId,bookmarkURL,bookmarkText,bookmarkCreationDate,source];
}