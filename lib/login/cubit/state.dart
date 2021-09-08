abstract class NewsLoginState {}

class NewsLoginIntialState extends NewsLoginState {}

class NewsLoginLoadingState extends NewsLoginState {}

class NewsLoginSuccessState extends NewsLoginState {
  final String uid;

  NewsLoginSuccessState(this.uid);
}

class NewsLoginErrorState extends NewsLoginState {
  final String error;

  NewsLoginErrorState(this.error);
}

class NewsChangePasswordVisbilityState extends NewsLoginState {}

