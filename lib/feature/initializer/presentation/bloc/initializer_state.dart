part of 'initializer_bloc.dart';

@CopyWith()
class InitializerState extends Equatable {
  final bool? isLogin;

  const InitializerState({
    this.isLogin = false,
  });

  @override
  List<Object?> get props => [
        isLogin,
      ];
}
