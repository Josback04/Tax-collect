enum AuthenticationState {
  authenticated,
  unauthenticated,
  loading,
  processing,
  failure,
}

enum BlocState { initial, loading, failed, success }

extension AuthenticationStateX on AuthenticationState {
  bool get isLoading => this == AuthenticationState.loading;

  bool get isLogin => this == AuthenticationState.authenticated;

  bool get isLogout => this == AuthenticationState.unauthenticated;

  bool get processing => this == AuthenticationState.processing;

  bool get isFailure => this == AuthenticationState.failure;
}

extension BlocStateX on BlocState {
  bool get isInitial => this == BlocState.initial;

  bool get isInProgress => this == BlocState.loading;

  bool get isSuccess => this == BlocState.success;

  bool get isFailure => this == BlocState.failed;

  bool get isInProgressOrSuccess => isInProgress || isSuccess;
}
