import 'package:firebase_auth/firebase_auth.dart';
import 'package:lynkripe_v1/models/models.dart';

abstract class FirebaseGoogleAuth{

    googleSignOut();
    Future<bool> signInWithGoogle();
}
