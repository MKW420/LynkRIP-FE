import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/pages/Home.dart';
import 'package:lynkripe_v1/pages/auth/auth_providers/signIn_provider.dart';
import 'package:lynkripe_v1/pages/navigation.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class AppView extends StatelessWidget{
    const AppView({super.key});
    @override
    Widget build(BuildContext context){
       return MaterialApp(
        home:  BlocBuilder<AuthBloc, AuthState>(
                builder: (context,state){
                  if(state.status == AuthenticationStatus.authenticated){
                    return BlocProvider(
                      create: (context) => SignInBloc(
                        userRepositiory: context.read<AuthBloc>().userRepo),
                        child: const NavigationBarPage(),
                        );
                  }
                  else{
                    return const AuthSignIn();
                  }
                }, 
              )
       );
    }
}
