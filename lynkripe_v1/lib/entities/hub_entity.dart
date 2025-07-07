import 'package:equatable/equatable.dart';

class HubEntity extends Equatable{
  final String hubId;
  final String userId;
  final String  bookmarkId;
  final String hubName;
  final String hubDescription;
  final DateTime? hubCreationDate;
  final String hubshareURL;

  const HubEntity({
    required this.hubId,
    required this.userId,
    required this.bookmarkId,
    required this.hubName,
    required this.hubDescription,
    required this.hubCreationDate,
    required this.hubshareURL

  });

  Map<String, Object?> toDocument(){
    return{
      'hubId': hubId,
      'userId': userId,
      'bookmarkId': bookmarkId,
      'hubName': hubName,
      'hubdescription': hubDescription,
      'hubCreationDate': hubCreationDate,
      'hubshareURL': hubshareURL,
    };
  }

   static HubEntity fromDocument(Map<String, dynamic> doc){
    return HubEntity(
      hubId: doc['hubId'],
      userId: doc['userId'],
      bookmarkId: doc['bookmarkId'],
      hubName: doc['hubName'],
      hubDescription: doc['hubDescription'],
      hubCreationDate: doc['hubCreationDate'],
      hubshareURL: doc['hubshareLink'],
      );
   }

  @override
  List<Object?> get props => [hubId,userId,bookmarkId,hubName,hubDescription,hubCreationDate,hubshareURL];
}