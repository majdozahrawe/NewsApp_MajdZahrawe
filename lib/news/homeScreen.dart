import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/components.dart';
import 'package:newsapp/news/newsList.dart';
import 'package:newsapp/news/cubit/stateN.dart';

import 'SearchScreen.dart';
import 'cubit/cubitN.dart';
import 'newsList.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsCubit,NewsState> (
      listener: (context,state){},
      builder: (context,state){
       // var cubit = NewsCubit.get(context);
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer For NewsApp'),
                ),
                ListTile(
                  title: const Text('Logout'),
                  onTap: () {
                   signOut(context);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );                  },
              ),
            ],
            title: Text(
                "News Page"
            ),
          ),
          body:NewsList(),
        );
      },
    );


  }
}
