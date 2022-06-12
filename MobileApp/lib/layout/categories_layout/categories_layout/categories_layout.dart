import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/resturant_app/search/search_screen.dart';
import 'package:untitled1/shared/components/component.dart';

class CategoriesLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cat = HomeCubit.get(context);

        return Scaffold(
          //اب بار ثابت علي كل الكاتوجريز
          appBar: AppBar(
            elevation: 1.0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {
                    navegateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ))
            ],
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                height: 20,
                width: 10,
              ),
            ),
            title: Text(
              'Kale me crazy',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: cat.categoriesScreen[cat.CurrentIndex],
        );
      },
    );
  }
}
