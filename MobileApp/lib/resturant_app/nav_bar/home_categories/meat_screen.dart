import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/model/home_model.dart';
import 'package:untitled1/model/user_model.dart';
import 'package:untitled1/resturant_app/nav_bar/home_categories/dish_detailes_screen.dart';
import 'package:untitled1/shared/components/component.dart';
import 'package:untitled1/shared/remote/colors/colors.dart';

class MeatScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var refresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubitH = HomeCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RefreshIndicator(
              key:refresh ,
              color: Colors.red,
              backgroundColor: Colors.white,
              displacement: 0.1,
              onRefresh: ()=> cubitH.getHomeData(),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                //هذا الكولوم الكبير
                child: ConditionalBuilder(
                  builder: (context) => homeProductsBuilder(
                      cubitH.userModel, cubitH.homeModel, context),
                  condition: HomeCubit.get(context).homeModel != null &&
                      HomeCubit.get(context).userModel != null,
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget homeProductsBuilder(UserModel user, HomeAndCategoryModel model, context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //اسم العميل
//اسم العميل
        Text(
          '${'Hi'+' '+user.user.firstname +' '+user.user.lastname}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'What do you',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Text(
          'want to eat today?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        //الفورم فيلت ثابت وانا استدعيته من الكبوننت (السيرش)
        // defaultFormField(
        //   controller: searchController,
        //   type: TextInputType.text,
        //   suffix: Icons.search,
        //   label: 'Search Food'.toString(),
        //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        // ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              //الايكونات بتاعت categories
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 0,
                selectedItemColor: defaultColor,
                unselectedItemColor: Colors.grey,
                currentIndex: HomeCubit.get(context).CurrentIndex,
                type: BottomNavigationBarType.fixed,
                items: HomeCubit.get(context).bottomsIcons,
                onTap: (int index) {
                  HomeCubit.get(context).ChangeNavBarIcons(index);
                },
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        //شكل اظهار الكاتيجوريز
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 20.0,
          childAspectRatio: 1 / 1.4,
          children: List.generate(model.data.category.elementAt(1).products.product.length,
                  (index) => buildGridProduct(model.data.category.elementAt(1).products.product[index], context)),
        )
      ]);

  Widget buildGridProduct(ProductCat model, context) => Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            HomeCubit.get(context).getProductDetails(productId: '${model.id}');
            navegateTo(context, DishDetails());
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(model.dishImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 160,
            width: double.infinity,
          ),
        ),
        SizedBox(height: 12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 110,
                  child: Text(
                    model.dishName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      HomeCubit.get(context).changeFavorites(model.id);
                      print(model.id);
                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor:
                      HomeCubit.get(context).favorites[model.id]
                          ? Colors.red
                          : Colors.grey,
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                        size: 18,
                      ),
                    ))
              ],
            ),
            Row(
              children: [
                Text(
                  ' ${model.dishPrice}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      HomeCubit.get(context).addCarts(model.id);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor:Colors.green,
                        content: Text('Added to cart successfully!'),padding: EdgeInsetsDirectional.all(20),duration: Duration(milliseconds: 800),
                      ));
                    },
                    icon: CircleAvatar(
                        radius: 15,
                        backgroundColor: defaultColor,
                        child: Icon(
                          Icons.shopping_cart,
                          size: 15,
                          color: Colors.white,
                        )))
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
