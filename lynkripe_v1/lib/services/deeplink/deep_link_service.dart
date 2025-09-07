import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lynkripe_v1/Routes/routing.dart';
import 'package:lynkripe_v1/app.dart';
import 'package:lynkripe_v1/constants.dart';
import 'package:lynkripe_v1/pages/auth/auth_providers/signIn_provider.dart';
import 'package:lynkripe_v1/pages/home.dart';
import 'package:lynkripe_v1/pages/navigation.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class DeepLinkService extends  State<MyApp>{

  final GoRouter _goRouter = Routerconfig.router;
  
 
  late final AppLinks _appLinks;
  StreamSubscription<Uri>?  _linkSubscription;

  @override
  void initState(){
    super.initState();

      WidgetsBinding.instance.addPostFrameCallback((_) {
      initDeepLinks();
  });
  }

 
  Future<void>initDeepLinks() async{
   // debugPrint('Handling URI: LANDED 1');
    _appLinks = AppLinks();
    try{
    
    if(widget.intialUri != null){
      _handleDeepLink(widget.intialUri!);
    }
    _linkSubscription = _appLinks.uriLinkStream.listen((uri){
      _handleDeepLink(uri);
    });

    }
    catch(e){
      debugPrint('deeplink error: $e');
      _goRouter.go(Routerconfig.home);
    }

  }

  void _handleDeepLink(Uri? uri){
    final id =  uri?.queryParameters['id'];

    if (uri == null || uri.path.isEmpty) {
      _goRouter.go(Routerconfig.home); 
      return;
    }
    if(id != null){
      _goRouter.pushNamed(
        Routerconfig.sharedHub,
        queryParameters: {'id': id},
      );
    }
}

@override
  void dispose(){
    _linkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _goRouter,  // Pass the routerConfig (GoRouter) to handle app navigation.
      debugShowCheckedModeBanner: false,  
      
       builder: (context, child) {
      return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          // This will be applied to all routes
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => SignInBloc(
                userRepositiory: context.read<AuthBloc>().userRepo,
              ),
              child: child, // The router's content
            );
          } else {
            return const AuthSignIn(); // Override all routes when not authenticated
          }
        },
      );
     
  });
    
  }
}


