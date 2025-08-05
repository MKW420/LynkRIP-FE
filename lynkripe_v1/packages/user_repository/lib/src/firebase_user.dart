import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';
import 'package:user_repository/src/auth_repository.dart';

class FirebaseUserRepo implements UserRepositiory{
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

   FirebaseUserRepo({
    FirebaseAuth? firebaseAuth
  }): _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  
  @override
  Future<MyUser?> signIn(String email, String password) async{

    try{
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.toString().trim(),
        password: password.toString().trim());
        final User?  firebaseUser = userCredential.user;
        if(firebaseUser != null){
          return MyUser(
            userId: firebaseUser.uid,
            email: firebaseUser.email ?? '',
            name: firebaseUser.displayName ?? '',
          );
        }
          print(firebaseUser);


     }on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        print("No user found with that email.");
      }
      else if(e.code == 'wrong-password'){
       print("Wrong password provided for this user.");
      }
      else{
         print('ERROR'+ e.toString());
      }
    }
    return null;
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

    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser != null){
        await FirebaseAuth.instance.signOut();
    }
     print("User sign out");
  }
  
}