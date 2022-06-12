import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/kalr_me_crazy.dart';
import 'package:untitled1/model/order_model.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/cubit/cubit.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/order_detailes.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/review.dart';
import 'package:untitled1/shared/components/component.dart';
import 'package:untitled1/shared/remote/colors/colors.dart';

import 'cubit/states.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<OrderCubit>(context)..getMyOrderData(),
      child: BlocConsumer<OrderCubit, orderState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            body: Stack(
              children: [
                design(
                  chiled: ConditionalBuilder(
                    condition: OrderCubit.get(context).myOrder != null,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => CartItem(
                              OrderCubit.get(context)
                                  .myOrder
                                  .data
                                  .myOrder[index],
                              context),
                          separatorBuilder: (context, index) => SizedBox(),
                          itemCount: OrderCubit.get(context)
                              .myOrder
                              .data
                              .myOrder
                              .length),
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            navegateAndReplacement(context,KaleMeCrazy());
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                          )),
                      Center(
                        child: Text(
                          'My Order',
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
      ),
    );
  }

  Widget CartItem(MyOrder order, context) => Padding(
        padding: const EdgeInsets.only(bottom: 20.0,left: 20,right: 20),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                OrderCubit.get(context).MyOrderDetailsData('${order.id}');
                navegateTo(context, OrderDetailesScreen());
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            order.orderDate,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Spacer(),
                      if(order.orderOnline==true)
                      Text('Online Order',style: TextStyle(
                        color: Colors.green,
                          fontSize: 17.0
                      ),)
                      else if(order.orderOnline==false)
                        Text('In Resturant',style: TextStyle(
                          color:defaultColor,
                            fontSize: 17.0
                        ),)
                       // defaultTextButton(
                      //     text: 'Review',
                      //     color: defaultColor,
                      //     function: () {
                      //       navegateTo(context, Reveiw());
                      //     })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
