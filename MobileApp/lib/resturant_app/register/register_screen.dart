import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/resturant_app/login_screen/login_screen.dart';
import 'package:untitled1/resturant_app/register/cubit/cubit.dart';
import 'package:untitled1/resturant_app/register/cubit/states.dart';
import 'package:untitled1/shared/components/component.dart';
import 'package:untitled1/shared/remote/colors/colors.dart';


class SignupScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var birthdateController = TextEditingController();
  bool isMale = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResturantRegisterCubit(),
      child: BlocConsumer<ResturantRegisterCubit, ResturantRegisterStates>(
        listener: (context, state) {
          if(state is ResturantRegisterSuccessState ){ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text('Check You Mail'),
            padding: EdgeInsetsDirectional.all(20),
            duration: Duration(milliseconds: 800),
          ));
            navegateTo(context, LoginScreen());
          }
        },
        builder: (context, state) {
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
                      physics: BouncingScrollPhysics(),
                      //الكولوم الكبير
                      child: Column(
                        children: [
                          //الزورارين بتاع اللوج ان و الريجستر
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                // الزورار انا مسبته ومستدعيه بتاع اللوج ان ثابت في الكومبوننت
                                child: defaultButton(
                                  // background: HexColor("F23B3F"),
                                  function: () {
                                    Navigator.push(context,
                                        BouncyPageRoute(widget: LoginScreen()));
                                  },
                                  text: 'login',
                                  background: Colors.white,
                                  elevation: 0.0,
                                  textColors: defaultColor,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                // الزورار انا مسبته ومستدعيه بتاع الريجستر ثابت في الكومبوننت
                                child: defaultButton(
                                    width: 30,
                                    background: defaultColor,
                                    function: () {},
                                    text: 'signup',
                                    textColors: Colors.white),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //ثابت بتاع الفورم فيلد وانا بستدعيه من الكومبوننت

                                defaultFormField(
                                  controller: firstNameController,
                                  label: 'First name',
                                  prefix: Icons.person_add_alt_1,
                                  type: TextInputType.text,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'please enter your First Name';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  controller: lastNameController,
                                  label: 'Last name',
                                  prefix: Icons.person_add_alt_1,
                                  type: TextInputType.text,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'please enter your Last name';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  controller: userNameController,
                                  prefix: Icons.person,
                                  label: 'user name',
                                  type: TextInputType.text,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'please enter your user name';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  controller: birthdateController,
                                  label: 'birth of date',
                                  prefix: Icons.date_range_outlined,
                                  type: TextInputType.datetime,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'please enter your birth of date';
                                    }
                                  },
                                    onTap: () {
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2050))
                                          .then((value) {
                                        String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(value);
                                        birthdateController.text = formattedDate;
                                        print(birthdateController.text.toString());
                                      },);
                                    }
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  controller: emailController,
                                  label: 'Email',
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
                                  prefix: Icons.lock_outline,
                                  label: 'Password',
                                  type: TextInputType.visiblePassword,
                                  suffix: ResturantRegisterCubit.get(context)
                                      .suffix,
                                  isPassword:
                                      ResturantRegisterCubit.get(context)
                                          .isPassword,
                                  suffixPressed: () {
                                    ResturantRegisterCubit.get(context)
                                        .ChangePasswordVisibility();
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'please enter your password';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                // defaultFormField(
                                //   controller: confirmController,
                                //   label: 'Confirm password',
                                //   prefix: Icons.lock_outline,
                                //   type: TextInputType.visiblePassword,
                                //   suffix: ResturantRegisterCubit.get(context)
                                //       .suffix,
                                //   isPassword:
                                //       ResturantRegisterCubit.get(context)
                                //           .isPassword,
                                //   suffixPressed: () {
                                //     ResturantRegisterCubit.get(context)
                                //         .ChangePasswordVisibility();
                                //   },
                                //   validate: (String value) {
                                //     if (value.isEmpty) {
                                //       return 'please confirm your password';
                                //     }
                                //   },
                                // ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  controller: phoneController,
                                  indexLenght: 11,
                                  label: 'Phone number',
                                  prefix: Icons.phone_android_rounded,
                                  type: TextInputType.phone,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'please enter your phone number';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  controller: addressController,
                                  label: 'address',
                                  prefix: Icons.add_location_alt_outlined,
                                  type: TextInputType.text,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'please enter your address';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Gender',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                //دا بتاع اختيار الميل والفيميل
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'male',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Radio(
                                            activeColor: Colors.red,
                                            value: 1,
                                            groupValue:
                                                ResturantRegisterCubit.get(
                                                        context)
                                                    .index,
                                            onChanged: (value) {
                                              ResturantRegisterCubit.get(
                                                      context)
                                                  .Radio(value);
                                              isMale = true;
                                              print(isMale);
                                            }),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'female',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Radio(
                                            activeColor: Colors.red,
                                            value: 2,
                                            groupValue:
                                                ResturantRegisterCubit.get(
                                                        context)
                                                    .index,
                                            onChanged: (value) {
                                              ResturantRegisterCubit.get(
                                                      context)
                                                  .Radio(value);
                                              isMale = false;
                                            }),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                //دي بتاعت الزرار بتاع تسجيل البيانات

                                ConditionalBuilder(
                                  condition:
                                      state is! ResturantRegisterLoadingState,
                                  builder: (BuildContext context) =>
                                      defaultButton(
                                          function: () {
                                            if (formKey.currentState
                                                .validate()) {
                                              ResturantRegisterCubit.get(
                                                      context)
                                                  .userRegister(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                                username:
                                                    userNameController.text,
                                                address: addressController.text,
                                                phone: phoneController.text,
                                                // password2:
                                                //     confirmController.text,
                                                firstname:
                                                    firstNameController.text,
                                                lastname:
                                                    lastNameController.text,
                                                birthdate:
                                                    birthdateController.text,
                                                is_male: isMale,
                                              );
                                            }
                                          },
                                          text: 'sign up'),
                                  fallback: (context) => Center(
                                      child: CircularProgressIndicator()),
                                ),
                                SizedBox(
                                  height: 20,
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
