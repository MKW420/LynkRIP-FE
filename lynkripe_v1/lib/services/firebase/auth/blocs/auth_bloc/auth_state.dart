part of 'auth_bloc.dart';

enum AuthenticationStatus {authenticated, unauthenticated, unknown}

class AuthState extends Equatable{

  final AuthenticationStatus status;
  final User? user;

  const AuthState._({
    this.status = AuthenticationStatus.unknown,
    this.user 
  });

  const AuthState.unknown() : this._();

  const AuthState.authentication(User user): 
       this._(status: AuthenticationStatus.authenticated, user:user);

  const AuthState.unauthenticated(): 
       this._(status: AuthenticationStatus.unauthenticated);

         @override
         List<Object?> get props => [status, user];

}