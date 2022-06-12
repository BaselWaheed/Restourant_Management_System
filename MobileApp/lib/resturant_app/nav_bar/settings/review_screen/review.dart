
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/shared/components/component.dart';
import 'package:untitled1/shared/remote/colors/colors.dart';

class Reveiw extends StatelessWidget {
  var reveiwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is ResturantReviewSuccessState ){
          if(state.sendReview.status){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.sendReview.massege),
              padding: EdgeInsetsDirectional.all(20),
              duration: Duration(milliseconds: 800),
            ));
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              design(
                  chiled: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Feedback is important to us because it helps us progress and solve problems.',
                                      style: TextStyle(
                                          height: 1.3,
                                          fontSize: 22,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),                      Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: defaultFormField(
                              maxLines: 3,
                              controller: reveiwController,
                              label: 'Reveiw',
                              type: TextInputType.text,
                              prefix: Icons.rate_review_outlined,
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: defaultColor,
                                ),
                                child: defaultButton(
                                  function: () {
                                    HomeCubit.get(context)
                                        .userReview(comment: reveiwController.text);
                                    reveiwController.clear();
                                  },
                                  text: 'send',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        )),
                    Center(
                      child: Text(
                        'Reveiw',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

