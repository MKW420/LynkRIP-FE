import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/pages/app_view.dart';
import 'package:lynkripe_v1/pages/auth_register.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:user_repository/user_repository.dart';
import '/pages/onboarding/onboarding.dart';
import '/pages/Home.dart';
import '/pages/hubs.dart';
import '/pages/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


class MyApp extends StatelessWidget {
  final UserRepositiory  userRepositiory;

  const MyApp( this.userRepositiory, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        userRepo: userRepositiory,
        ),
        child: const AppView(),
    );
  }
}
