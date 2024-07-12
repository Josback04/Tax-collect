part of 'auth_bloc.dart';

@CopyWith()
class AuthState extends Equatable {
  final AuthenticationState? loginState;
  final String? message;

  final String? username;

  const AuthState({
    this.loginState = AuthenticationState.unauthenticated,
    this.message,
    this.username,
  });

  @override
  List<Object?> get props => [
        loginState,
        message,
        username,
      ];
}
