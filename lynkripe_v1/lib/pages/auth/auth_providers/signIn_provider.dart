import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lynkripe_v1/Routes/routing.dart';
import 'package:lynkripe_v1/pages/auth/auth_signIn.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

 class AuthSignIn extends StatefulWidget {
  const AuthSignIn({super.key});

  @override
  State<AuthSignIn> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthSignIn> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
      //  final GoRouter _goRouter = Routerconfig.router;

    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(userRepositiory: context.read<AuthBloc>().userRepo),
      child:const AuthSignInScreen()
      );
}
}
