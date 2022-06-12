import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/kalr_me_crazy.dart';
import 'package:untitled1/shared/components/component.dart';

class ChangePasswordScreen extends StatelessWidget {
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is ResturantChangepasswordSuccessState){
          if(state.changePasswordModel.status){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.changePasswordModel.success),
              padding: EdgeInsetsDirectional.all(20),
              duration: Duration(milliseconds: 950),
            ));
            navegateAndReplacement(context,KaleMeCrazy());
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(state.changePasswordModel.message),
              padding: EdgeInsetsDirectional.all(20),
              duration: Duration(milliseconds: 950),
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
                  padding: const EdgeInsets.only(top: 140, right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        defaultFormField(
                          controller: currentPasswordController,
                          prefix: Icons.lock_outline,
                          label: 'Current Password',
                          type: TextInputType.visiblePassword,
                          //controller:
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: newPasswordController,
                          label: 'Enter New Password',
                          prefix: Icons.lock_outline,
                          type: TextInputType.visiblePassword,
                          suffix: HomeCubit.get(context).suffix,
                          isPassword: HomeCubit.get(context).isPassword,
                          suffixPressed: () {
                            HomeCubit.get(context).ChangePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your new Password';
                            }
                          },
                          //controller:
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: confirmNewPasswordController,
                          label: 'Confirm New Password',
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock_outline,
                          suffix: HomeCubit.get(context).suffix,
                          isPassword: HomeCubit.get(context).isPassword,
                          suffixPressed: () {
                            HomeCubit.get(context).ChangePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your Confirm new Password';
                            }
                          },
                          //controller:
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        defaultButton(
                          text: 'Save',
                          function: () {
                            HomeCubit.get(context).userChangePassword(
                              old_password: currentPasswordController.text,
                              new_password: newPasswordController.text,
                              confermation_password:
                                  confirmNewPasswordController.text,
                            );

                          },
                        ),
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
                        'Change Password',
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
    );
  }
}
