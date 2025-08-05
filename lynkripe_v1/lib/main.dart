import 'package:app_links/app_links.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/app.dart';
import 'package:lynkripe_v1/firebase_options.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:lynkripe_v1/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
 
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,

  );
  // await FirebaseAuth.instance.setSettings(
  //   appVerificationDisabledForTesting: true,
  // );
  Bloc.observer = SimpleBlocObserver();
  final appLinks = AppLinks();
  final intialUri = await appLinks.getInitialLink();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(
          userRepo: FirebaseUserRepo(),
          ))
      ], child:  MyApp(FirebaseUserRepo(), intialUri:intialUri)));
  

}
