import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/components.dart';
import 'package:newsapp/login/login.dart';
import 'package:newsapp/news/homeScreen.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';

class NewsRegisterScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsRegisterCubit(),
      child: BlocConsumer<NewsRegisterCubit, NewsRegisterStates>(
        listener: (context, state) {
          if(state is NewsCreateUserSuccessState){
           navigateAndFinish(context: context, widget: NewsScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Register now to connect with friends',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,

                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter your email address';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'UserName',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                    TextFormField(
                      controller: emailController,
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
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: passwordController,
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
                    SizedBox(
                      height: 10.0,
                    ),

                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.number,

                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter An Number';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    if (state is! NewsRegisterLoadingState)
                      BuildCondition(
                        condition: state is! NewsRegisterLoadingState,
                        builder: (context)=> Center(
                          child: FlatButton(
                              color: Colors.blue,
                              minWidth: 70,
                              onPressed: (){
                                NewsRegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: mobileController.text);
                              },
                              child: Text("Register",
                                style: TextStyle(
                                  color: Colors.white,

                                ),)),

                        ),
                      ),
                    if (state is NewsRegisterLoadingState)
                      Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
