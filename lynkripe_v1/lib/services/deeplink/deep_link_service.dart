import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lynkripe_v1/Routes/routing.dart';
import 'package:lynkripe_v1/app.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';

class DeepLinkService extends  State<MyApp>{

  final GoRouter _goRouter = Routerconfig.router;
  
 
  late final AppLinks _appLinks;
  StreamSubscription<Uri>?  _linkSubscription;

  @override
  void initState(){
    super.initState();
    // initDeepLinks();
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
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            userRepo: widget.userRepositiory,
          ),
            // Optional: Add initial event
        ),
      ],
      
    child: MaterialApp.router(
      routerConfig: _goRouter,
      debugShowCheckedModeBanner: false,
    ),
    );
  }
  

}
