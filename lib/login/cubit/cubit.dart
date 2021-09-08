import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/login/cubit/state.dart';

class NewsLoginCubit extends Cubit<NewsLoginState>{
  NewsLoginCubit() : super(NewsLoginIntialState());

  static NewsLoginCubit get(context) => BlocProvider.of(context);


  void userLogin({
   required String email,
   required String password
  })
  {
    emit(NewsLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value){
          print(value.user!.email);
          print(value.user!.uid);
          emit(NewsLoginSuccessState(value.user!.uid));
    }).catchError((error){
      print("UserLogin Error!");
      emit(NewsLoginErrorState(error.toString()));
    });


  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(NewsChangePasswordVisbilityState());

  }
}