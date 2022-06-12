import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/resturant_app/forget_password/cubit/cubit.dart';
import 'package:untitled1/resturant_app/forget_password/cubit/states.dart';
import 'package:untitled1/resturant_app/login_screen/login_screen.dart';
import 'package:untitled1/shared/components/component.dart';

class ForgetPasswordScreen extends StatelessWidget {
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResturantForgetpasswordCubit(),
      child: BlocConsumer<ResturantForgetpasswordCubit,
          ResturantForgetpasswordStates>(
        listener: (context, state) {
          if (state is ResturantForgetpasswordSuccessState) {
            if (state.forgetPassword.status) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(state.forgetPassword.messege),
                padding: EdgeInsetsDirectional.all(20),
                duration: Duration(milliseconds: 800),
              ));
              navegateTo(context, LoginScreen());
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red.withOpacity(0.7),
                content: Text(state.forgetPassword.messege),
                padding: EdgeInsetsDirectional.all(20),
                duration: Duration(milliseconds: 800),
              ));
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                design(
                  chiled: Padding(
                    padding: const EdgeInsets.only(
                      top: 90,
                      left: 20,
                      right: 20,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/forget.jpg',),
                              height: 300,
                              width: 300,
                              fit: BoxFit.cover,),

                          SizedBox(height: 10,),

                          defaultFormField(
                            controller: emailController,
                            prefix: Icons.email_outlined,
                            label: 'Email',
                            type: TextInputType.emailAddress,),

                          SizedBox(height: 40.0,),

                          defaultButton(
                            text: 'Send',
                            function: () {
                              ResturantForgetpasswordCubit.get(context)
                                  .userForgetPassword(
                                      email: emailController.text);},),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                          )),
                      Center(
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
