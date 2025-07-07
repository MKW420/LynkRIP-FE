import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;

  Stream<User?> get authStateChanges => auth.authStateChanges();
  
  // Future<UserCredential>  signIn({
  //   required String email,
  //   required password,

  // })async{
  //   return await auth.signInWithEmailAndPassword(email: email, password:password);
  // }

  // Future<UserCredential>  createAccount({
  //   required String email,
  //   required password,

  // })async{
  //   return await auth.createUserWithEmailAndPassword(email: email, password:password);
  // }


  final googleSignIn = GoogleSignIn();

  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();

      if (googleSignInAccount == null) {
        return false;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await auth.signInWithCredential(authCredential);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return false;
    }
  }

  googleSignOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("user created: ${credential.user?.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use.') {
        print('The account already exists');
      }
    } catch (e) {
      print(e);
    }
  }

 

  Future<void> SignInWithEmailAndPassword( String email,  String password) async{
    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      print("User signed in:${credential.user?.uid}");
    }
    on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        print("No user found with that email.");
      }
      else if(e.code == 'wrong-password'){
       print("Wrong password provided for this user.");
      }
    }
  }

  Future<void> signOut()async{
    await FirebaseAuth.instance.signOut();
    print("User sign out");
  }
}
