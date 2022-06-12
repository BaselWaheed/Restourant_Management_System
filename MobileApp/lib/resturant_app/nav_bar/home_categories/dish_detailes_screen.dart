import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/model/product_detailes_model.dart';
import 'package:untitled1/shared/components/component.dart';

class DishDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
            body: ConditionalBuilder(
          condition: cubit.productDetailsModel != null,
          builder: (context) =>
              productDetailes(cubit.productDetailsModel, context),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ));
      },
    );
  }

  Widget productDetailes(ProductDetailsModel product, context) => Stack(
        alignment: Alignment.topCenter,
        children: [
          design(
            chiled: Padding(
              padding: const EdgeInsets.only(
                top: 150,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      product.data.dishName,
                      style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      overflow:TextOverflow.ellipsis ,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.data.dishDiscription,
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          // SizedBox(
                          //   height: 50,
                          // ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Price :' +
                                      " " +
                                      product.data.dishPrice +
                                      ' ' +
                                      'EG',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                defaultButton2(
                                    function: () {
                                      HomeCubit.get(context).addCarts(product.data.id);
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        backgroundColor:Colors.green,
                                        content: Text('Added to cart successfully!'),padding: EdgeInsetsDirectional.all(20),duration: Duration(milliseconds: 800),
                                      ));
                                    },
                                    text: 'Add To Cart',
                                    width: 150,
                                    icon: Icons.shopping_cart,
                                    iconSize: 25,
                                    iconColor: Colors.white)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(product.data.dishImage),
              // child: Image(
              //   image: AssetImage('assets/images/salad.png'),
              //   width: 200,
              //   height: 200,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    )),
                Spacer(),
                // IconButton(onPressed: (){}, icon: Icon(
                //   Icons.favorite_outline,color: Colors.white,
                // )),
              ],
            ),
          )
        ],
      );
}
