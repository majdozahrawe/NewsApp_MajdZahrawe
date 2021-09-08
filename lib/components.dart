
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/cacheShared.dart';
import 'package:newsapp/login/login.dart';

import 'details/detailsScreen.dart';

Widget BuildArticalItem(article,context)=>InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsScreen()),
    ),
  child:   Padding(

    padding:const EdgeInsets.all(20) ,
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              )
          ) ,
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${article['title']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),),
                ),
                Text('${article['author']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),

                Text('${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),

              ],
            ),
          ),
        )
      ],
    ),),
);

Widget buildSep ()=> Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
);

Widget articleBuilder (list,context,{isSearch = false})=>BuildCondition(
  condition: list.length>0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index)=> BuildArticalItem(list[index],context),
    separatorBuilder: (context,index)=>buildSep(),
    itemCount: list.length,),
  fallback: (context) => isSearch ?Container() : Center(child: CircularProgressIndicator()),

);


Widget buildDetails(article,context)=>Padding(
  padding:const EdgeInsets.all(20) ,
  child: Row(
    children: [
      Expanded(
        child: Container(
          width: double.infinity,
          height: 300,
          decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              )
          ) ,
        ),
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text('${article['title']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),),
              ),
              Text('${article['author']}',
                style: TextStyle(
                  color: Colors.grey,
                ),),

              Text('${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),),
            ],
          ),
        ),
      )
    ],
  ),);


void navigateAndFinish({
  required context,
  required widget,
}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );


void signOut (context){
  CacheHelper.removeData(key: 'token',).then((value) {
    if (value){
      navigateAndFinish(context: context, widget: LoginScreen());
    }
  });
}