import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/pages/signIn.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

 class AuthSignUp extends StatefulWidget {
  const AuthSignUp({super.key});

  @override
  State<AuthSignUp> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthSignUp> with TickerProviderStateMixin{
  @override

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(userRepositiory: context.read<AuthBloc>().userRepo),
      child:const AuthSignInScreen()
      );
}
}
