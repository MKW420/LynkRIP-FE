import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepositiory _userRepositiory;
  
  
  SignUpBloc({
    required UserRepositiory userrepository
  }) :  _userRepositiory = userrepository,
  super(SignUpInitial()){
    on<SignUpRequired>((event,emit) async{
      emit(SignUpProcess());
      try{
        MyUser user = await _userRepositiory.signUp(event.user, event.password);
        await _userRepositiory.setUserData(user);
        emit(SignUpSuccess());

      }
      catch(e){
        emit(SignUpFailure());
      } 
    });
  }
}
