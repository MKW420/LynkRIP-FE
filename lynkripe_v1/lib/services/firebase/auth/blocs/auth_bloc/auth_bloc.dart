import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lynkripe_v1/services/firebase/auth/firebase_user.dart';
import 'package:lynkripe_v1/services/firebase/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

 class AuthBloc extends Bloc<AuthEvent, AuthState>{
  
   final UserRepositiory userRepo;

   late final StreamSubscription<User?> _userSubscription;

  AuthBloc({required this.userRepo}): super(const AuthState.unknown()){
    _userSubscription = userRepo.user.listen((user){
      add(AuthUserChanged(user));
    });

    on<AuthUserChanged>((event, emit){
      if(event.user != null){
        emit(AuthState.authentication(event.user!));
      }else{
         emit(AuthState.unauthenticated());
      }
    });
  }

  @override
  Future<void> close(){
    _userSubscription.cancel();
    return super.close();
  }
  

  
}
