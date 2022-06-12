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
                chiled: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    state is! ResturantLoadingGetFavoritesState,
                widgetBuilder: (context) {
                  return (HomeCubit.get(context).favoritesModel != null &&
                          HomeCubit.get(context)
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
