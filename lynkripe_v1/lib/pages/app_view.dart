import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/pages/Home.dart';
import 'package:lynkripe_v1/pages/hubs.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';

class AppView extends StatelessWidget{
    const AppView({super.key});
    @override
    Widget build(BuildContext context){
       return MaterialApp(
        home:  BlocBuilder<AuthBloc, AuthState>(
                builder: (context,state){
                  if(state.status == AuthenticationStatus.authenticated){
                    return const Explore();
                  }
                  else{
                    return const Hubs();
                  }
                }, 
              )
       );
    }
}