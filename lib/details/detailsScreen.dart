import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news/cubit/cubitN.dart';
import 'package:newsapp/news/cubit/stateN.dart';

import 'bodyDetails.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state){
      return Scaffold(
          appBar: AppBar(
            title: Text("Details Screen"),
          ),
          body:BodyOfDetails(),
      );
    },
    );
  }
}
