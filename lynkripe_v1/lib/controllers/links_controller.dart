import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lynkripe_v1/repositories/link_repo.dart';
import 'dart:convert';
import 'package:user_repository/user_repository.dart';

class LinksController implements LinkRepo {
    final user = FirebaseAuth.instance.currentUser;

    
  @override
  Future<void> createLink(Bookmark bookmark) async {
    if(user != null){
      final userId = user!.uid;

      final newLink = Bookmark(
        bookmarkId: bookmark.bookmarkId,
        userId: userId,
        bookmarkURL: bookmark.bookmarkURL, 
        bookmarkText: bookmark.bookmarkText, 
        bookmarkCreationDate: bookmark.bookmarkCreationDate, 
        source: bookmark.source, 
        tags: bookmark.tags);


        final String jsonString = jsonEncode(newLink);
        final Map<String, dynamic> data = jsonDecode(jsonString);

        await FirebaseFirestore.instance.collection('Links').add(data);
    }
  
  }

  @override
  Future<void> deleteLink(String id) async {
      if(user != null){
      // final userId = user?.uid;
        await FirebaseFirestore.instance.collection('Links').doc(id).delete();
    }
  }

  @override
  Future<List<Map<String,dynamic>>> getAllLinks() async {
       List<Map<String,dynamic>> myList = []; 
       if(user != null){

         QuerySnapshot links = await FirebaseFirestore.instance.collection('Links').get();

         for(var doc in links.docs){
          myList.add(doc.data() as Map<String, dynamic>);

         }       
       }
        return myList;
  }

  @override
  Future<Map<String,dynamic>?> getLink(String id)async {
  
    if(user!=null){
      try{
         DocumentSnapshot documentSnapshot  = await  FirebaseFirestore.instance.collection('Links').doc(id).get();
      
          if(documentSnapshot.exists){
            return documentSnapshot.data() as Map<String,dynamic>;
          }
          else{
            print('document does not exist');
            return null;
          }
      }
      catch(e){
        print('Error getting document: $e');
        return null;
      }
    }
  }
}