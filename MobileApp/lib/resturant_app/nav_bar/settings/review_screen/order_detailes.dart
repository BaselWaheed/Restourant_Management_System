import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/order_detailes_model.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/cubit/cubit.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/cubit/states.dart';


class OrderDetailesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit,orderState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            iconTheme: IconThemeData(
              color: Colors.black
            ),

            title: Text('your order',style: TextStyle(
              color: Colors.black
            ),),
          ),
          body: ConditionalBuilder(
            condition: OrderCubit.get(context).orderDetailesModel!=null,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) =>buildListOrder(
                  OrderCubit.get(context).orderDetailesModel.data.myOrders[index],context) ,
              itemCount: OrderCubit.get(context).orderDetailesModel.data.myOrders.length,
              separatorBuilder: (context, index) => Container(width: double.infinity,height: 1,color: Colors.grey[300],),
              physics: BouncingScrollPhysics(),
            ),
            fallback: (context) =>  Center(child: CircularProgressIndicator()),
          ),
        );
      } ,
    );
  }
  Widget buildListOrder(MyOrders orders ,context) => Padding(
    padding:
    const EdgeInsets.all(20),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(orders.dish.dishImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          width: 130.0,
          height: 130.0,
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                orders.dish.dishName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.0,
                  height: 1.3,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                   Text('Quantity :'+'${orders.quantity}'),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    orders.price.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
