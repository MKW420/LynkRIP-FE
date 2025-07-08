import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lynkripe_v1/models/user_model.dart';
import 'package:lynkripe_v1/services/firebase/repository/auth_repository.dart';

class FirebaseUser implements Firebaserepo{
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

   FirebaseUser({
    FirebaseAuth? firebaseAuth
  }): _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> signIn(String email, String password) async{

    try{
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password);

     }on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        print("No user found with that email.");
      }
      else if(e.code == 'wrong-password'){
       print("Wrong password provided for this user.");
      }
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async{
     try{
      UserCredential user= await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email, 
        password: password);

        myUser = myUser.copyWith(
          userId: user.user!.uid
        );
        return myUser;
     }catch(e){
      rethrow;
     }
  }

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
        return firebaseUser;
    });
  }

  @override
  Future<void> setUserData(MyUser myUser)async {
    try{
      await usersCollection.doc(myUser.userId).set(myUser.toEntity().toDocument());

    }catch(e){
      rethrow;
    }
  }
  
  @override
  Future<void> signOut() async {
     await FirebaseAuth.instance.signOut();
     print("User sign out");
  }
  

}