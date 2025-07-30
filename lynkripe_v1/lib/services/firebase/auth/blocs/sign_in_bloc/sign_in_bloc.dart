import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_bloc_event.dart';
part 'sign_in_bloc_state.dart';

class SignInBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
   final UserRepositiory _userRepositiory;

   SignInBloc({
    required UserRepositiory userRepositiory
   }): _userRepositiory=userRepositiory,
   super(SignInBlocInitial()){
     on<SignInRequired>((event,emit) async {
      emit(SignInProcess());
      try{
        await _userRepositiory.signIn(event.email, event.password);
        emit(SignInSuccess());

      } on FirebaseAuthException catch(e){
        emit(SignInFailure(message: e.code));
      }
      catch(e){
        emit(SignInFailure());
      } 

     });
     on<SignOutRequired>((event, emit) async{
      await _userRepositiory.signOut();
     });
    
   }
}
