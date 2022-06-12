// chiled: Padding(
//   padding: const EdgeInsets.only(top: 80,
//       right: 20,
//       left: 20
//   ),
//   child: GridView.count(
//     physics: BouncingScrollPhysics(),
//     crossAxisCount: 2,
//     mainAxisSpacing: 0.0,
//     crossAxisSpacing: 7.0,
//     childAspectRatio: 1/1.5,
//     children: List.generate(10,(index) => Container(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration:BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/food.jpeg'),
//                 fit: BoxFit.cover,
//
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ) ,
//             height: 160,
//             width: double.infinity,
//
//           ),
//           Padding(
//             padding: const EdgeInsetsDirectional.only(start: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Beef Meal ',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500
//                       ),
//                     ),
//                     Spacer(),
//                     IconButton(onPressed: (){},
//                         icon:Icon(Icons.favorite_border)
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       '60 EGP ',
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.grey
//                       ),
//                     ),
//                     Spacer(),
//                     IconButton(onPressed: (){},
//                         icon:CircleAvatar(
//                             radius: 12,
//                             backgroundColor: Colors.red,
//                             child: Icon(Icons.add,size: 20,))
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     )),
//   ),
// ),
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/shared/components/component.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Stack(
            children: [
            design(
                // chiled: ConditionalBuilder(
                //   condition: state is! ResturantLoadingGetFavoritesState,
                //   builder: (context) => ListView.separated(
                //     itemBuilder: (context, index) => buildListProduct(
                //         HomeCubit.get(context).favoritesModel.data.product[index],
                //         context),
                //     separatorBuilder: (context, index) => Container(
                //       width: double.infinity,
                //       height: 1,
                //       color: Colors.grey[300],
                //     ),
                //     itemCount:
                //         HomeCubit.get(context).favoritesModel.data.product.length,
                //   ),
                //   fallback: (context) =>
                //       Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Icon(
                //               Icons.favorite,
                //               size: 100,
                //               color: Colors.red,
                //             ),Text(
                //               'No Favorite Items Yet, Please Add some',style: TextStyle(
                //               fontSize: 10,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.grey
                //             ),
                //             )
                //           ],
                //         ),
                //       )
                // ),
                chiled: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    state is! ResturantLoadingGetFavoritesState,
                widgetBuilder: (context) {
                  return (HomeCubit.get(context)
                      .favoritesModel!=null&&HomeCubit.get(context)
                              .favoritesModel
                              .data
                              .product
                              .length !=
                          0)
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
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                itemBuilder: (context, index) =>
                                    buildListProduct(
                                  HomeCubit.get(context)
                                      .favoritesModel
                                      .data
                                      .product[index],
                                  context,
                                ),
                                separatorBuilder: (context, index) =>
                                    Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: Colors.grey[300],
                                ),
                                itemCount: HomeCubit.get(context)
                                    .favoritesModel
                                    .data
                                    .product
                                    .length,
                              ),
                            ),
                          ],
                        ),
                      )
                      : Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 80,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'No Favorite Items Yet, Please Add some',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ));
                },
                fallbackBuilder: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Favorite Meal',
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
        ));
      },
    );
  }
}
