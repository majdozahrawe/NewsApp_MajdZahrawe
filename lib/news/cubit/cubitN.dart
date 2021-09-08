import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news/cubit/stateN.dart';

import '../dio_helper.dart';

class NewsCubit extends Cubit<NewsState>
{
  NewsCubit() : super(NewsInitialState());
  
  static NewsCubit get(context)=> BlocProvider.of(context);


  List<dynamic> Items = [];

  void getItems(){
    emit(NewsGetItemLoadingState());
    
    DioHelper.getData(
      url: "v2/everything",
      query: {
        'q':'keyword',
        'apikey':'da41319e75b54ce5b18d5fea93372884',
      },
    ).then((value){
      // print (value.data['articles']);

      Items = value.data['articles'];
      print(Items);
      
emit(NewsGetItemSuccessState());
    }).catchError((error){
      print (error.toString());
      emit(NewsGetItemErrorState(error.toString()));
    });
  }



  List<dynamic> search = [];

void getSearch(String value){
  emit(NewsGetSearchLoadingState());

  DioHelper.getData(
    url: "v2/everything",
    query: {
      'q':'$value',
      'apikey':'da41319e75b54ce5b18d5fea93372884',
    },
  ).then((value){
    // print (value.data['articles']);

    search = value.data['articles'];
    print(search);

    emit(NewsGetSearchSuccessState());
  }).catchError((error){
    print (error.toString());
    emit(NewsGetSearchErrorState(error.toString()));
  });
}


  List<dynamic> details = [];

  void getDetails(){
    emit(NewsGetDetailsLoadingState());

    DioHelper.getData(
      url: "v2/everything",
      query: {
        'q':'keyword',
        'apikey':'da41319e75b54ce5b18d5fea93372884',
      },
    ).then((value){
      // print (value.data['articles']);

      details = value.data['articles'];
      print(details);

      emit(NewsGetDetailsSuccessState());
    }).catchError((error){
      print (error.toString());
      emit(NewsGetDetailsErrorState(error.toString()));
    });
  }



}
