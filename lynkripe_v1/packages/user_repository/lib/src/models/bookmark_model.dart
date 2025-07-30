
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';


class Bookmark extends Equatable{

  final String  bookmarkId;
  final String bookmarkURL;
  final String? bookmarkText;
  final DateTime? bookmarkCreationDate;
  final String source;
  final List<String> tags;


//CONSTRUCTER
  const Bookmark({
    required this.bookmarkId,
    required this.bookmarkURL,
    required this.bookmarkText,
    required this.bookmarkCreationDate,
    required this.source,
    required this.tags
   
  });

  static const empty = Bookmark(
    bookmarkId: '', 
    bookmarkURL: '', 
    bookmarkText: '',
    bookmarkCreationDate: null,
    source: '',
    tags: []
    );
    

//modify those fields
    Bookmark copyWith({
      String? bookmarkId,
      String? bookmarkURL,
      String? bookmarkText,
      DateTime? bookmarkCreationDate,
      String? source,
      List<String>? tags
    }){
      return Bookmark(
       bookmarkId: bookmarkId ?? this.bookmarkId, 
       bookmarkURL: bookmarkURL ?? this.bookmarkURL, 
       bookmarkText: bookmarkText ?? this.bookmarkText, 
       bookmarkCreationDate: bookmarkCreationDate ?? this.bookmarkCreationDate, 
       source: source ?? this.source,
       tags: tags ?? this.tags
      );
    }

    BookmarkEntity toEntity(){
       return BookmarkEntity(
         bookmarkId: bookmarkId,
         bookmarkURL: bookmarkURL,
         bookmarkText: bookmarkText,
         bookmarkCreationDate: bookmarkCreationDate,
         source: source,
         tags:tags
       
       );
    }

    static Bookmark fromEntity(BookmarkEntity entity){
      return Bookmark(
        bookmarkId: entity.bookmarkId, 
        bookmarkURL: entity.bookmarkURL, 
        bookmarkText: entity.bookmarkText,
        bookmarkCreationDate: entity.bookmarkCreationDate,
        source: entity.source,
        tags:entity.tags
        );
    }
  
  @override
  List<Object?> get props => [bookmarkId,bookmarkURL,bookmarkText,bookmarkCreationDate,source, tags];
  
}