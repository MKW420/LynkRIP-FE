import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/pages/auth_signIn.dart';
import 'package:lynkripe_v1/pages/auth_signUp.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/sign_up_bloc/sign_up_bloc.dart';

 class AuthSignUp extends StatefulWidget {
  const AuthSignUp({super.key});

  @override
  State<AuthSignUp> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthSignUp> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(userrepository: context.read<AuthBloc>().userRepo),
      child:const SignUpScreen()
      );
}
}
