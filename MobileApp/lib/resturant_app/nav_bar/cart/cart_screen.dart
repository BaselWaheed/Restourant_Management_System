// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:restaurant/layout/categories_layout/categories_layout/cubit/cubit.dart';
// import 'package:restaurant/layout/categories_layout/categories_layout/cubit/state.dart';
// import 'package:restaurant/model/cart_model.dart';
// import 'package:restaurant/remote/colors/colors.dart';
// import 'package:restaurant/shared/components/component.dart';
//
// class CartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           body: SafeArea(
//               child: ConditionalBuilder(
//             condition: HomeCubit.get(context).cartModel != null,
//             builder: (context) => Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ListView.separated(
//                 itemBuilder: (context, index) => cartBuilder(
//                     HomeCubit.get(context).cartModel.data.cartItem[index],
//                     context),
//                 separatorBuilder: (context, index) => SizedBox(),
//                 itemCount:
//                     HomeCubit.get(context).cartModel.data.cartItem.length,
//               ),
//             ),
//             fallback: (context) => Center(child: CircularProgressIndicator()),
//           )),
//         );
//       },
//     );
//   }
// }
//
// // Widget Cart(CartModel cart,CartItem model, context) => Padding(
// //       padding: const EdgeInsets.all(20.0),
// //       child: Column(
// //         children: [
// //           Column(
// //             children: [
// //               Container(
// //                 height: 100,
// //                 decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(100),
// //                     color: Colors.white,
// //                     border: Border.all(color: Colors.black)),
// //                 child: Row(
// //                   children: [
// //                     CircleAvatar(
// //                       radius: 70,
// //                       backgroundImage: NetworkImage(model.dish.dishImage),
// //                     ),
// //                     Column(
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                       children: [
// //                         Text(
// //                           model.dish.dishName,
// //                           style: TextStyle(fontSize: 20),
// //                         ),
// //                         SizedBox(
// //                           height: 15,
// //                         ),
// //                         Text(
// //                           model.dish.dishPrice,
// //                           style: TextStyle(fontSize: 20),
// //                         ),
// //                       ],
// //                     ),
// //                     Spacer(),
// //                     Container(
// //                       height: 35,
// //                       decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(40),
// //                           color: defaultColor),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.only(right: 8.0),
// //                             child: Container(
// //                               width: 20,
// //                               child: IconButton(
// //                                 onPressed: () {
// //                                   HomeCubit.get(context).min();
// //                                 },
// //                                 icon: Icon(
// //                                   Icons.remove,
// //                                   color: Colors.white,
// //                                   size: 20,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             width: 10,
// //                           ),
// //                           Container(
// //                             alignment: Alignment.center,
// //                             height: 35,
// //                             width: 35,
// //                             decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(40),
// //                                 color: Colors.white),
// //                             child: Text(
// //                               '${HomeCubit.get(context).counter}',
// //                               maxLines: 1,
// //                               style: TextStyle(
// //                                 fontSize: 20,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             width: 10,
// //                           ),
// //                           Padding(
// //                             padding: const EdgeInsets.only(right: 8.0),
// //                             child: Container(
// //                               width: 20,
// //                               child: IconButton(
// //                                 padding: EdgeInsets.zero,
// //                                 onPressed: () {
// //                                   HomeCubit.get(context).plus();
// //                                 },
// //                                 icon: Icon(
// //                                   Icons.add,
// //                                   color: Colors.white,
// //                                   size: 20,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Container(
// //             width: double.infinity,
// //             height: 320,
// //             decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.only(
// //                   topRight: Radius.circular(50),
// //                   topLeft: Radius.circular(50),
// //                 ),
// //                 border: Border.all(color: Colors.black)),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.only(
// //                     top: 40.0,
// //                     right: 40,
// //                     left: 40,
// //                   ),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Center(
// //                         child: Text(
// //                           'Payment Summary',
// //                           style: TextStyle(
// //                               fontSize: 20, fontWeight: FontWeight.w600),
// //                         ),
// //                       ),
// //                       SizedBox(
// //                         height: 20,
// //                       ),
// //                       Row(
// //                         children: [
// //                           Text(
// //                             'Subtotal',
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                             ),
// //                           ),
// //                           Spacer(),
// //                           Text(
// //                             '145 EGP',
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(
// //                         height: 20,
// //                       ),
// //                       Row(
// //                         children: [
// //                           Text(
// //                             'Delivery feets',
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                             ),
// //                           ),
// //                           Spacer(),
// //                           Text(
// //                             '10 EGP',
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(
// //                         height: 20,
// //                       ),
// //                       Row(
// //                         children: [
// //                           Text(
// //                             'Total Amount',
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                             ),
// //                           ),
// //                           Spacer(),
// //                           Text(
// //                             '${cart.data.totalPrice}',
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(
// //                         height: 40,
// //                       ),
// //                       Row(
// //                         children: [
// //                           defaultButton(
// //                             text: 'Add Items',
// //                             function: () {},
// //                             width: 150,
// //                           ),
// //                           Spacer(),
// //                           defaultButton(
// //                             text: 'Checkout',
// //                             function: () {},
// //                             width: 150,
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/kalr_me_crazy.dart';
import 'package:untitled1/model/cart_model.dart';
import 'package:untitled1/resturant_app/nav_bar/cart/create_order.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/order_screen.dart';
import 'package:untitled1/shared/components/component.dart';
import 'package:untitled1/shared/remote/colors/colors.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<HomeCubit>(context)..getCarts(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if(state is ResturantSuccessCheckOutInStates){
              navegateTo(context, OrderScreen());
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text('Order Created Successfully'),
                padding: EdgeInsetsDirectional.all(20),
                duration: Duration(milliseconds: 800),
              ));
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text('Cart Screen',style: TextStyle(
                  color: Colors.black
                ),),
                backgroundColor: Colors.white,
              ),
              body: Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                state is! ResturantLoadingOrderDataStates||HomeCubit.get(context).getCarts()!=null,
                widgetBuilder: (context) {
                  return (HomeCubit.get(context).cartModel!=null&&HomeCubit.get(context).cartModel.data.cartItem.length!=0
                          )
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 6,
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    itemBuilder: (context, index) => cartBuilder(
                                      HomeCubit.get(context)
                                          .cartModel
                                          .data
                                          .cartItem[index],
                                      context,
                                    ),
                                    separatorBuilder: (context, index) =>
                                       Container(width: double.infinity,height: 1,color: Colors.grey[300],),
                                    itemCount: HomeCubit.get(context)
                                        .cartModel
                                        .data
                                        .cartItem
                                        .length,
                                  ),
                                ),
                              ),
                              if (state is CartRemoveLoadingState ||
                                  state is CartLoadingUpdateQuantityState
                              )
                                LinearProgressIndicator(
                                  color: defaultColor,
                                ),
                              Expanded(
                                flex: 4,
                                // child: Container(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 20.0),
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     borderRadius: BorderRadius.only(
                                //       topLeft: Radius.circular(30.0),
                                //       topRight: Radius.circular(30.0),
                                //     ),
                                //     border: Border.all(color: Colors.black)
                                //   ),
                                //   child: Row(
                                //     children: [
                                //       Expanded(child: Text('Total Price :',style: TextStyle(
                                //         fontSize: 20.0,
                                //         fontWeight: FontWeight.bold,
                                //       ),)),
                                //       Expanded(
                                //         child: Text(
                                //           HomeCubit.get(context)
                                //               .cartModel
                                //               .data
                                //               .totalPrice
                                //               .toString(),
                                //           style: TextStyle(
                                //             fontSize: 20,
                                //             fontWeight: FontWeight.bold,
                                //           ),
                                //         ),
                                //       ),
                                //       Expanded(
                                //         child: ClipRRect(
                                //           borderRadius:
                                //               BorderRadius.circular(10.0),
                                //           child: defaultButton(
                                //             text: 'Check Out',fontSize: 15,
                                //             function: () {
                                //                navegateTo(context, CreateOrderScreen());
                                //             },
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                child:  Container(
                                  width: double.infinity,
                                  height: 320,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50),
                                        topLeft: Radius.circular(50),
                                      ),
                                      border: Border.all(color: Colors.black)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 40.0,
                                          right: 40,
                                          left: 40,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                'Payment Summary',
                                                style: TextStyle(
                                                    fontSize: 20, fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Subtotal',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  HomeCubit.get(context)
                                                      .cartModel
                                                      .data
                                                      .subTotal
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Delivery feets',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  HomeCubit.get(context)
                                                      .cartModel
                                                      .data
                                                      .delivery
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Total Amount',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  HomeCubit.get(context)
                                                      .cartModel
                                                      .data
                                                      .totalPrice
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              children: [
                                                defaultButton(
                                                  text: 'In Resturant',
                                                  function: () {
                                                    HomeCubit.get(context).checkOut();

                                                  },
                                                  width: 150,
                                                ),
                                                Spacer(),
                                                defaultButton(
                                                  text: 'Delivery',
                                                  function: () {
                                                    navegateTo(context, CreateOrderScreen());
                                                  },
                                                  width: 150,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    'Cart is Empty',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Check our product and order now!',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: defaultColor,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: defaultButton(
                                    text: 'Check Products',
                                    function: () {
                                      navegateAndReplacement(context,KaleMeCrazy());
                                      KaleCrazyCubit.get(context).CurrentIndex=0;                                  },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                },
                fallbackBuilder: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }),
    );
  }
}

Widget cartBuilder(CartItem model, context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(model.dish.dishImage),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 100,
                height: 100,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      model.dish.dishName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      model.dish.dishPrice,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width:5,
              ),
              // CircleAvatar(
              //   backgroundColor: defaultColor,
              //   radius: 20,
              //   child: IconButton(
              //     alignment: Alignment.center,
              //     onPressed: () {
              //       if (model.quantity > 1) {
              //         HomeCubit.get(context).updateQuantityOfInCartProduct(
              //             model.id, model.quantity-1);
              //       }
              //     },
              //     icon: Icon(
              //       Icons.remove,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: 5,
              // ),
              // Text(model.quantity.toString(),
              //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
              // SizedBox(
              //   width: 5,
              // ),
              // CircleAvatar(
              //   backgroundColor: defaultColor,
              //   radius: 20,
              //   child: IconButton(
              //     alignment: Alignment.center,
              //     onPressed: () {
              //       HomeCubit.get(context).updateQuantityOfInCartProduct(
              //           model.id, model.quantity + 1
              //       );
              //       print(model.id);
              //     },
              //     icon: Icon(
              //       Icons.add,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
                     Container(
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: defaultColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 20,
                                child: IconButton(
                                  onPressed: () {
                                        if (model.quantity> 1) {
                                                HomeCubit.get(context).updateQuantityOfInCartProduct(
                                                    model.id, model.quantity-1);
                                              }
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              child: Text(
                                model.quantity.toString(),
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 20,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    HomeCubit.get(context).updateQuantityOfInCartProduct(
                                                model.id, model.quantity + 1);
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

              IconButton(
                onPressed: () {
                  HomeCubit.get(context).deleteCarts(model.id);
                  print(model.id);
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red[800],
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );

// Widget cartBuilder(CartItem model, context) =>
//     Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         width: double.infinity,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Image(
//               image: NetworkImage(model.dish.dishImage
//               ),
//               height: 100,
//               width: 100,
//             ),
//             SizedBox(
//               width: 15,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [ SizedBox(
//                   height: 15,
//                 ),
//                   Text(
//                     model.dish.dishName,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ), SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     model.dish.dishPrice,
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: 15,
//             ),
//             CircleAvatar(
//               backgroundColor: defaultColor,
//               radius: 20,
//               child: IconButton(
//                 alignment: Alignment.center,
//                 onPressed: () {
//                   HomeCubit.get(context).updateQuantityOfInCartProduct(
//                       model.id, model.quantity + 1);
//                 },
//                 icon: Icon(
//                   Icons.add,
//                   color: Colors.grey[350],
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Text(model.quantity.toString(),
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w800
//                 )),
//             SizedBox(
//               width: 5,
//             ),
//             CircleAvatar(
//               backgroundColor: defaultColor,
//               radius: 20,
//               child: IconButton(
//                 alignment: Alignment.center,
//                 onPressed: () {   if (model.quantity > 1) {
//
//                   HomeCubit.get(context).updateQuantityOfInCartProduct(
//                       model.id,model.quantity);
//
//
//                 }
//
//                 },
//                 icon: Icon(
//                   Icons.remove,
//                   color: Colors.grey[350],
//                 ),
//               ),
//             ), SizedBox(
//               width: 10,
//             ),
//             IconButton(
//               onPressed: () {
//                 // HomeCubit.get(context)
//                 //     .deleteCarts(model.id);
//               },
//               icon: Icon(
//                 Icons.delete_forever,
//                 color: Colors.red[800],
//                 size: 30,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
