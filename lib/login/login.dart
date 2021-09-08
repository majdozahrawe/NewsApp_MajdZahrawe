import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:newsapp/news/homeScreen.dart';
import 'package:newsapp/register/registerScreen.dart';

import '../cacheShared.dart';
import '../components.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

var emailControler = TextEditingController();
var passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> NewsLoginCubit(),
      child: BlocConsumer<NewsLoginCubit,NewsLoginState>(
        listener: (context,state){
          if (state is NewsLoginErrorState){
            print("TEST");
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
          if (state is NewsLoginSuccessState){
            CacheHelper.saveData(
                key: 'uid',
                value: state.uid
            ).then((value){
              navigateAndFinish(
                context: context,
                 widget: NewsScreen(),
              );
            });
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("LOGIN",
                        style: Theme.of(context).textTheme.headline5),
                    Text("login Now to be always up to date with the latest news",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey)
                    ),
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: emailControler,
                      keyboardType: TextInputType.emailAddress,

                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter your email address';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: passwordControler,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,

                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter your Password ';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline),

                        // suffixIcon: NewsLoginCubit.get(context).suffix,
                        // onPressed: () {
                        //
                        // },
                      ),
                    ),
                SizedBox(height: 30,),
                Center(
                  child: FlatButton(
                      color: Colors.blue,
                      minWidth: 70,
                      onPressed: (){

                        NewsLoginCubit.get(context).userLogin(
                            email: emailControler.text,
                            password: passwordControler.text
                        );

                      },
                      child: Text("LOGIN",
                        style: TextStyle(
                          color: Colors.white,

                        ),)),

                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text("Don\'t have an account?"
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsRegisterScreen()),
                      );                    },
                      child: Text("Register"),),
                  ],
                )
                ],
              ),
            ),
          ),
          ),
          );
        },
      ),
      );

  }
}
