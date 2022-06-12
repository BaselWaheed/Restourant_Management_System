import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/cubit/state.dart';
import 'package:untitled1/resturant_app/login_screen/login_screen.dart';
import 'package:untitled1/resturant_app/splash_screen/spalsh_screen.dart';
import 'package:untitled1/resturant_app/splash_screen/start_splash.dart';
import 'package:untitled1/shared/block_observer.dart';
import 'package:untitled1/shared/conistant/constant.dart';
import 'package:untitled1/shared/remote/cash_helper.dart';
import 'package:untitled1/shared/remote/dio_helper.dart';

import 'resturant_app/nav_bar/settings/review_screen/cubit/cubit.dart';
//........
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  Widget widget;
  bool onBoarding = CashHelper.getData(key: 'onBoarding');
  token = CashHelper.getData(key: 'token');
  print(token);
  if (onBoarding != null) {
    if (token != null)
      widget = StartScreen();
    else
      widget = LoginScreen();
  } else {
    widget = SplashScreen();
  }
  runApp(MyApp(
    startwidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;

  MyApp({this.startwidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => KaleCrazyCubit(),
        ),
        BlocProvider(
          create: (context) => OrderCubit(),
        ),
        BlocProvider(
            create: (BuildContext context) => HomeCubit()
              ..getHomeData()
              ..getFavorites()
              ..getUserData()
              ..getReviewData()
        ),
      ],
      child: BlocConsumer<KaleCrazyCubit, KaleCrazyState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child),
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: '4K'),
              ],
            ),
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            debugShowCheckedModeBanner: false,
            home: startwidget,
          );
        },
      ),
    );
  }
}
