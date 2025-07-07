import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lynkripe_v1/entities/bookmark_entity.dart';
import 'package:lynkripe_v1/entities/hub_entity.dart';
import '../entities/entities.dart';

class Bookmark extends Equatable{

  final String  bookmarkId;
  final String bookmarkURL;
  final String? bookmarkText;
  final DateTime? bookmarkCreationDate;
  final String source;


//CONSTRUCTER
  const Bookmark({
    required this.bookmarkId,
    required this.bookmarkURL,
    required this.bookmarkText,
    required this.bookmarkCreationDate,
    required this.source,
   
  });

  static const empty = Bookmark(
    bookmarkId: '', 
    bookmarkURL: '', 
    bookmarkText: '',
    bookmarkCreationDate: null,
    source: '',
    );
    

//modify those fields
    Bookmark copyWith({
      String? bookmarkId,
      String? bookmarkURL,
      String? bookmarkText,
      DateTime? bookmarkCreationDate,
      String? source,
    }){
      return Bookmark(
       bookmarkId: bookmarkId ?? this.bookmarkId, 
       bookmarkURL: bookmarkURL ?? this.bookmarkURL, 
       bookmarkText: bookmarkText ?? this.bookmarkText, 
       bookmarkCreationDate: bookmarkCreationDate ?? this.bookmarkCreationDate, 
       source: source ?? this.source
      );
    }

    BookmarkEntity toEntity(){
       return BookmarkEntity(
         bookmarkId: bookmarkId,
         bookmarkURL: bookmarkURL,
         bookmarkText: bookmarkText,
         bookmarkCreationDate: bookmarkCreationDate,
         source: source,
       
       );
    }

    static Bookmark fromEntity(BookmarkEntity entity){
      return Bookmark(
        bookmarkId: entity.bookmarkId, 
        bookmarkURL: entity.bookmarkURL, 
        bookmarkText: entity.bookmarkText,
        bookmarkCreationDate: entity.bookmarkCreationDate,
        source: entity.source,
        );
    }
  
  @override
  List<Object?> get props => [bookmarkId,bookmarkURL,bookmarkText,bookmarkCreationDate,source];
  
}