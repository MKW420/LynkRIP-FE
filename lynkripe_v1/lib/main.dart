import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/app.dart';
import 'package:lynkripe_v1/firebase_options.dart';
import 'package:lynkripe_v1/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}
