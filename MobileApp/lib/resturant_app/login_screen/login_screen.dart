import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/kalr_me_crazy.dart';
import 'package:untitled1/resturant_app/forget_password/forget_password_screen.dart';
import 'package:untitled1/resturant_app/login_screen/cubit/cubit.dart';
import 'package:untitled1/resturant_app/login_screen/cubit/states.dart';
import 'package:untitled1/resturant_app/register/register_screen.dart';
import 'package:untitled1/shared/components/component.dart';
import 'package:untitled1/shared/conistant/constant.dart';
import 'package:untitled1/shared/remote/cash_helper.dart';
import 'package:untitled1/shared/remote/colors/colors.dart';


class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResturantLoginCubit(),
      child: BlocConsumer<ResturantLoginCubit, ResturantLoginStates>(
        listener: (BuildContext context, state) {
          if (state is ResturantLoginSuccessState) {
            if (state.loginModel.status) {
              CashHelper.saveData(
                      key: 'token', value: state.loginModel.data.token)
                  .then((value) {
                token = state.loginModel.data.token;
                HomeCubit.get(context).getUserData();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KaleMeCrazy(),
                    ), (route) {
                  return false;
                });
              });
            }
          }else if(state is ResturantLoginErorrState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text('Email or Password are incorrect,Check it'),
              padding: EdgeInsetsDirectional.all(20),
              duration: Duration(milliseconds: 950),
            ));
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            //الديزاين ثابت وانا بستدعيه
            body: Stack(
              children: [
                design(
                  chiled: Padding(
                    padding:
                        const EdgeInsets.only(top: 120, left: 35, right: 35),
                    //هنا بعمل اسكرول للكولوم
                    child: SingleChildScrollView(
                      //الكولوم الكبير
                      child: Column(
                        children: [
                          //الزورارين بتاع اللوج ان و الريجستر
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                // الزورار انا مسبته ومستدعيه بتاع اللوج ان ثابت في الكومبوننت
                                child: defaultButton(
                                    background: defaultColor,
                                    function: () {},
                                    text: 'login',
                                    textColors: Colors.white),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                //الزورار انا مسبته ومستدعيه بتاع الريجستر
                                child: defaultButton(
                                  width: 30,
                                  //background: HexColor("F23B3F"),
                                  function: () {
                                    Navigator.push(
                                        context,
                                        BouncyPageRoute(
                                            widget: SignupScreen()));
                                  },
                                  text: 'signup',
                                  elevation: 0.0,
                                  background: Colors.white,
                                  textColors: defaultColor,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Form(
                            key: formKey,
                            //الكولوم دا ماسك المحتوي بتاع الفورم فيلد والزرار
                            child: Column(
                              children: [
                                //ثابت بتاع الفورم فيلد وانا بستدعيه من الكومبوننت
                                defaultFormField(
                                  controller: emailController,
                                  label: 'email',
                                  prefix: Icons.email_outlined,
                                  type: TextInputType.emailAddress,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'please enter your email address';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  controller: passwordController,
                                  label: 'password',
                                  prefix: Icons.lock_outline,
                                  type: TextInputType.visiblePassword,
                                  suffix: ResturantLoginCubit.get(context).suffix,
                                  isPassword:ResturantLoginCubit.get(context).isPassword,
                                  suffixPressed: () {
                                   ResturantLoginCubit.get(context).ChangePasswordVisibility();
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'please enter your Password';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                //دي بتاعت هل نسيت الباسورد ؟
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    defaultTextButton(
                                        function: () {
                                          navegateTo(
                                              context, ForgetPasswordScreen());
                                        },
                                        text: 'forget password?',
                                        color: defaultColor)
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                ConditionalBuilder(
                                  condition:
                                      state is! ResturantLoginLoadingState,
                                  builder: (BuildContext context) =>
                                      defaultButton(
                                          function: () {
                                            if (formKey.currentState
                                                .validate()) {
                                              ResturantLoginCubit.get(context)
                                                  .userLogin(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text);
                                            }
                                          },
                                          text: 'Login'),
                                  fallback: (context) => Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
