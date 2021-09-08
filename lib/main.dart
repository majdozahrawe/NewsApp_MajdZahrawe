import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cacheShared.dart';
import 'package:newsapp/news/dio_helper.dart';
import 'package:newsapp/news/homeScreen.dart';

import 'login/login.dart';
import 'news/cubit/cubitN.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
 var uid = CacheHelper.getData(key: 'uid');

  if (uid!=null){
    widget = NewsScreen();
  }
  else{
    widget = LoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key? key, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit()..getItems(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
          debugShowCheckedModeBanner: false,
        home: startWidget
      ),
    );
  }
}

