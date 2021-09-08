

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/components.dart';
import 'package:newsapp/news/cubit/stateN.dart';

import 'cubit/cubitN.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state){
      var list = NewsCubit.get(context).search;
      return Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  NewsCubit.get(context).getSearch(value);

                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'search must not empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),),
              ),
            ),
            Expanded(child: articleBuilder(list,context,isSearch: true)),
          ],
        ),
      );
      },
    );
  }
}
