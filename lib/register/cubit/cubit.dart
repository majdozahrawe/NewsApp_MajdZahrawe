
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/model.dart';
import 'package:newsapp/register/cubit/state.dart';

class NewsRegisterCubit extends Cubit<NewsRegisterStates> {
  NewsRegisterCubit() : super(NewsRegisterInitialState());

  static NewsRegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void userRegister( {
  required String name,
  required String email,
  required String password,
  required String phone
  }){

    emit(NewsRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.uid);
      print(value.user!.email);

      userCreate(name: name,
          email: email,
          uid: value.user!.uid,
          phone: phone
      );
    })
        .catchError((error) {
      print('User Authentication Error => ${error.toString()}');
      emit(NewsRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String uid,
    required String phone
}){

    NewsUserModel model = NewsUserModel(
        email: email,
        name: name,
        phone: phone,
        uid: uid);
    
    FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .set(model.toMap())
        .then((value){

          emit(NewsCreateUserSuccessState());

    }).catchError((error){
      print (error.toString());
      emit(NewsCreateUserErrorState(error.toString()));

    });

    
}
}