import 'package:flutter/material.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/cubit/cubit.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/account_info/account_info.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/comments.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/order_screen.dart';
import 'package:untitled1/shared/components/component.dart';
import 'package:untitled1/shared/remote/colors/colors.dart';

import 'aboutus_screen/aboutus.dart';
import 'change_password/change_password_screen.dart';


class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          design(
            chiled: Padding(
              padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Account Info',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            navegateTo(context, AccountInfo());
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'My Order',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            navegateTo(context, OrderScreen());
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Change Password',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            navegateTo(context, ChangePasswordScreen());
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            navegateTo(context, ReviewScreen());
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            navegateTo(context, AboutUs());
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: defaultColor,
                        ),
                        child: defaultButton2(
                            text: 'Log Out',
                            function: () {
                              KaleCrazyCubit.get(context).CurrentIndex = 0;
                              signOut(context);
                            },
                            icon: Icons.logout,
                            iconColor: Colors.white,
                            iconSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Settings',
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
  }
}
