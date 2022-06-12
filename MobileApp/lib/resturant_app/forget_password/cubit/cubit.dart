import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/forget_password_model.dart';
import 'package:untitled1/resturant_app/forget_password/cubit/states.dart';
import 'package:untitled1/shared/conistant/end_points.dart';
import 'package:untitled1/shared/remote/dio_helper.dart';


class ResturantForgetpasswordCubit extends Cubit<ResturantForgetpasswordStates> {
  ResturantForgetpasswordCubit() : super(ResturantForgetpasswordInitialState());

  static ResturantForgetpasswordCubit get(context) => BlocProvider.of(context);

  ForgetPasswordModel forgetPassword;

  void userForgetPassword({
    @required String email,

  }) {
    emit(ResturantForgetpasswordLoadingState());
    DioHelper.postdata(
      url: FORGET_PASSWORD,
      data: {
        'email': email,
      },
    ).then((value) {
      forgetPassword = ForgetPasswordModel.fromJson(value.data);
      emit(ResturantForgetpasswordSuccessState(forgetPassword));
    }).catchError((error) {
      emit(ResturantForgetpasswordErrorState(error.toString()));

    });
  }

}
