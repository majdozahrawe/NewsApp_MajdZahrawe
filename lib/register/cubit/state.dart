abstract class NewsRegisterStates {}

class NewsRegisterInitialState extends NewsRegisterStates {}

class NewsRegisterLoadingState extends NewsRegisterStates {}

class NewsRegisterSuccessState extends NewsRegisterStates {}

class NewsRegisterErrorState extends NewsRegisterStates {
  final String error;

  NewsRegisterErrorState(this.error);

}

class NewsCreateUserSuccessState extends NewsRegisterStates {}

class NewsCreateUserErrorState extends NewsRegisterStates {
  final String error;

  NewsCreateUserErrorState(this.error);

}

class NewsSetUserDataLoadingState extends NewsRegisterStates {}

class NewsSetUserDataSuccessState extends NewsRegisterStates {}

class NewsSetUserDataErrorState extends NewsRegisterStates {}