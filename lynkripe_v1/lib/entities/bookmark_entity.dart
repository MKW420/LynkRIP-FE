import 'package:equatable/equatable.dart';

class BookmarkEntity extends Equatable{
  final String  bookmarkId;
  final String bookmarkURL;
  final String? bookmarkText;
  final DateTime? bookmarkCreationDate;
  final String source;
  final List<String> tags;

  const BookmarkEntity({
    required this.bookmarkId,
    required this.bookmarkURL,
    required this.bookmarkText,
    required this.bookmarkCreationDate,
    required this.source,
    required this.tags
  });

  Map<String, Object?> toDocument(){
    return{
      'bookmarkId': bookmarkId,
      'bookmarkURL': bookmarkURL,
      'bookmarkText': bookmarkText,
      'bookmarkCreationDate': bookmarkCreationDate,
      'source': source,
      'tags': tags
    };
  }

   static BookmarkEntity fromDocument(Map<String, dynamic> doc){
    return BookmarkEntity(
      bookmarkId: doc['bookmarkId'],
      bookmarkURL: doc['bookmarkURL'],
      bookmarkText: doc['bookmarkText'],
      bookmarkCreationDate: doc['bookmarkCreationDate'],
      source: doc['source'],
      tags: doc['tags']
      );
   }

  @override
  List<Object?> get props => [bookmarkId,bookmarkURL,bookmarkText,bookmarkCreationDate,source, tags];
}