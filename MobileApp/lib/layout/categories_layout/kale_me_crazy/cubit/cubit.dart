import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/categories_layout.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/cubit/state.dart';
import 'package:untitled1/resturant_app/nav_bar/cart/cart_screen.dart';
import 'package:untitled1/resturant_app/nav_bar/favorite_screen/favorite.dart';
import 'package:untitled1/resturant_app/nav_bar/reaervation_screen/reservation_screen.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/settings_screen.dart';

import '../../../../caticons_icons.dart';

class KaleCrazyCubit extends Cubit<KaleCrazyState> {
  KaleCrazyCubit() : super(InitialCrazyState());

  static KaleCrazyCubit get(context) => BlocProvider.of(context);

//ايكونات ال button nav_bar of screens
  List<BottomNavigationBarItem> bottom = [
    BottomNavigationBarItem(
        icon: Icon(Caticons.home),
        label: ''),
    BottomNavigationBarItem(
        icon:Icon(Caticons.calendar),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(Caticons.cart),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(Caticons.fav),
        label: ''),
    BottomNavigationBarItem(
        icon:Icon(Caticons.settings_1),
        label: ''),
  ];

// button nav_bar الاسكرينات
  List<Widget> screen = [
    CategoriesLayout(),
    Reservation(),
    CartScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

//عشان انقل بين الصفحات
  int CurrentIndex = 0;

  void ChangeNavBar(int index) {
    CurrentIndex = index;
    emit(ChangeNavBarState());
  }
}
