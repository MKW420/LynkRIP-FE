import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lynkripe_v1/pages/auth/auth_providers/signIn_provider.dart';
import 'package:lynkripe_v1/pages/auth/auth_providers/signUp_provider.dart';
import 'package:lynkripe_v1/pages/auth/auth_signIn.dart';
import 'package:lynkripe_v1/pages/auth/auth_signUp.dart';
import 'package:lynkripe_v1/pages/home.dart';
import 'package:lynkripe_v1/pages/hubs.dart';
import 'package:lynkripe_v1/pages/navigation.dart';
import 'package:lynkripe_v1/pages/onboarding/onboarding.dart';
import 'package:lynkripe_v1/pages/profile.dart';
import 'package:lynkripe_v1/pages/shared_hub.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:user_repository/user_repository.dart';

class Routerconfig{
  static const String home = '/explore';
  static const String onboarding = '/';
  static const String signIn = '/signin';
  static const String signUp = '/signup';
  static const String hubs = '/hubs';
  static const String profile = '/profile';
  static const String sharedHub = '/sharedHub';
  
    final UserRepositiory userRepositiory;
    const Routerconfig(this.userRepositiory);

  static final GoRouter router = GoRouter(


    
    routes:[
       GoRoute(
        name:home,
        path: home,
        builder:(context, state) {
          final authState = context.read<AuthBloc>().state;     
           if(authState.status == AuthenticationStatus.authenticated){
             return BlocProvider<AuthBloc>(create: (context) => AuthBloc(
            userRepo: context.read<AuthBloc>().userRepo),
            child: const NavigationBarPage(),
          );
          }else{
            return AuthSignIn();
          }     
       }
      ),
        GoRoute(
        name:sharedHub,
        path: sharedHub,
        builder:(context, state) {
            final authState = context.read<AuthBloc>().state;    
            final String? id =  state.uri.queryParameters['id'];
           if(authState.status == AuthenticationStatus.authenticated){
             return BlocProvider(create: (context) => SignInBloc(
            userRepositiory: context.read<AuthBloc>().userRepo),
            child: SharedHub(hubId: id ?? ''),        
          );
          }else{
            return AuthSignIn();
          }
        }
      ),
        GoRoute(
        name:signIn,
        path: signIn,
        builder:(context,state) => const AuthSignIn()
      ),
         GoRoute(
        name:onboarding,
        path: onboarding,
        builder:(context,state) =>  OnboardingPage()
      ),
        GoRoute(
        name:signUp,
        path: signUp,
        builder:(context,state) => const AuthSignUp()
      ),
     ],
    
    redirect: (context,state){
      final authState = context.read<AuthBloc>().state;
      final isSignInRoute = state.uri.path == '/signIn';
    // unauthenticated and trying to access protected route
      if(authState.status != AuthenticationStatus.authenticated && !isSignInRoute){
        return Routerconfig.signIn;
      }

      if(authState.status == AuthenticationStatus.authenticated && isSignInRoute){
          return Routerconfig.home;
      }
      return null; 
    }
    
  );
  
}