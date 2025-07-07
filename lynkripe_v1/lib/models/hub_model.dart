import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lynkripe_v1/entities/hub_entity.dart';
import '../entities/entities.dart';

class Hubs extends Equatable{
  final String hubId;
  final String userId;
  final String  bookmarkId;
  final String hubName;
  final String hubDescription;
  final DateTime? hubCreationDate;
  final String hubshareURL;


//CONSTRUCTER
  const Hubs({
    required this.hubId,
    required this.userId,
    required this.bookmarkId,
    required this.hubName,
    required this.hubDescription,
    required this.hubCreationDate,
    required this.hubshareURL
  });

  static const empty = Hubs(
    hubId: '', 
    userId: '', 
    bookmarkId: '',
    hubName: '',
    hubDescription: '',
    hubCreationDate: null,
    hubshareURL: ''
    );
    

//modify those fields
    Hubs copyWith({
      String? hubId,
      String? userId,
      String? bookmarkId,
      String? hubName,
      String? hubDescription,
      DateTime? hubCreationDate,
      String? hubshareLink
    }){
      return Hubs(
       hubId: hubId ?? this.hubId, 
       userId: userId ?? this.userId, 
       bookmarkId: bookmarkId ?? this.bookmarkId, 
       hubName: hubName ?? this.hubName, 
       hubDescription: hubDescription ?? this.hubDescription,
       hubCreationDate: hubCreationDate ?? this.hubCreationDate,
       hubshareURL: hubshareLink ?? this.hubshareURL);
    }

    HubEntity toEntity(){
       return HubEntity(
         hubId: hubId,
         userId: userId,
         bookmarkId: bookmarkId,
         hubName: hubName,
         hubDescription: hubDescription,
         hubCreationDate: hubCreationDate,
         hubshareURL: hubshareURL,
       );
    }

    static Hubs fromEntity(HubEntity entity){
      return Hubs(
        hubId: entity.hubId, 
        userId: entity.userId, 
        bookmarkId: entity.bookmarkId,
        hubName: entity.hubName,
        hubDescription: entity.hubDescription,
        hubCreationDate: entity.hubCreationDate,
        hubshareURL: entity.hubshareURL,
        );
    }
  
  @override
  List<Object?> get props => [hubId,userId,bookmarkId,hubName,hubDescription,hubCreationDate,hubshareURL];
  
}