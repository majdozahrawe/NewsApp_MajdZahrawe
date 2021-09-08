abstract class NewsState {}

class NewsInitialState extends NewsState{}

class NewsGetItemSuccessState extends NewsState{}

class NewsGetItemLoadingState extends NewsState{}

class NewsGetItemErrorState extends NewsState{

final String error;

NewsGetItemErrorState(this.error);

}


class NewsGetSearchSuccessState extends NewsState{}

class NewsGetSearchLoadingState extends NewsState{}

class NewsGetSearchErrorState extends NewsState{

  final String error;

  NewsGetSearchErrorState(this.error);

}


class NewsGetDetailsSuccessState extends NewsState{}

class NewsGetDetailsLoadingState extends NewsState{}

class NewsGetDetailsErrorState extends NewsState{

  final String error;

  NewsGetDetailsErrorState(this.error);

}
