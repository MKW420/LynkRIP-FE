part of 'sign_in_bloc.dart';

sealed class SignInBlocState extends Equatable {
  const SignInBlocState();
  
  @override
  List<Object> get props => [];
}

final class SignInBlocInitial extends SignInBlocState {}
final class SignInSuccess extends SignInBlocState {}
final class SignInFailure extends SignInBlocState {
  final String? message;
  const SignInFailure({this.message});
}

final class SignInProcess extends SignInBlocState {}
