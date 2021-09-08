

import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news/cubit/stateN.dart';

import '../components.dart';
import 'cubit/cubitN.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state) {
        var list = NewsCubit.get(context).Items;
        return BuildCondition(
          condition:state is! NewsGetItemLoadingState,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=> BuildArticalItem(list[index],context),
              separatorBuilder: (context,index)=>buildSep(),
              itemCount: list.length,),
          fallback: (context) => Center(child: CircularProgressIndicator()),

        );
      },
    );
  }
}
