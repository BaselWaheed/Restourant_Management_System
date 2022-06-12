import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/model/review_model.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/review.dart';
import 'package:untitled1/shared/components/component.dart';


class ReviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.comment),
        onPressed: ()
        {
          navegateTo(context,Reveiw());
        },
      ),
      body: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          return ConditionalBuilder(
            condition:HomeCubit.get(context).reviewModel!=null ,
            builder: (context) {
              return RefreshIndicator(
                onRefresh: ()=>HomeCubit.get(context).getReviewData(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.separated(
                      itemBuilder: (context,index)=>ReviewBuilder(
                          HomeCubit.get(context).reviewModel.data.info[index]
                      ),
                      separatorBuilder:(context,index)=> SizedBox(height: 10,),
                      itemCount: HomeCubit.get(context).reviewModel.data.info.length
                  ),
                ),
              );
            },
            fallback: (context)=>Center(child: CircularProgressIndicator()),

          );
        },
      ),
    );
  }
}
Widget ReviewBuilder(InfoModel model)=>Column(
  children: [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[350],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(model.isMale==true)
              Image(image: AssetImage('assets/images/personalp.webp'),
                fit: BoxFit.contain,
                width: 80,
                height: 80,
              ),
            if(model.isMale==false)
              Image(image: AssetImage('assets/images/woman.png'),
                fit: BoxFit.contain,
                width: 80,
                height: 80,
              ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.user,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 270,
                  child: Text(model.comment,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ],
);