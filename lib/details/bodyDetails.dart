

import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news/cubit/cubitN.dart';
import 'package:newsapp/news/cubit/stateN.dart';

import '../components.dart';

class BodyOfDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state) {
        var list = NewsCubit.get(context).Items;

        return BuildCondition(
          condition:state is! NewsGetDetailsLoadingState,
          builder: (context) => ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=> buildDetails(list[index],context),
            itemCount: list.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
