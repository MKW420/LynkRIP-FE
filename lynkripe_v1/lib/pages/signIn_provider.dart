import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/pages/signIn.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

 class AuthSignIn extends StatefulWidget {
  const AuthSignIn({super.key});

  @override
  State<AuthSignIn> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthSignIn> with TickerProviderStateMixin{
  @override

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(userRepositiory: context.read<AuthBloc>().userRepo),
      child:const AuthSignInScreen()
      );
}
}
