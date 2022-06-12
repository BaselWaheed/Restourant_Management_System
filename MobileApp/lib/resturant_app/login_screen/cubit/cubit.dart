import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/login_model.dart';
import 'package:untitled1/resturant_app/login_screen/cubit/states.dart';
import 'package:untitled1/shared/conistant/end_points.dart';
import 'package:untitled1/shared/remote/dio_helper.dart';

class ResturantLoginCubit extends Cubit<ResturantLoginStates>{
  ResturantLoginCubit():super(ResturantLoginInitialState());
  static ResturantLoginCubit get(context)=>BlocProvider.of(context);
  //عملت منه اوبجيكت وخزنت فيه تحت
  LoginModel loginModel;
  void userLogin({
  @required String email,
  @required String password,
}){
    emit(ResturantLoginLoadingState());
      DioHelper.postdata(url:LOGIN, data:{
        'email':email,
        'password':password

      }).then((value){
        print(value.data);
       loginModel= LoginModel.fromJson(value.data);
        emit(ResturantLoginSuccessState(loginModel));
      }).catchError((error){
      emit(ResturantLoginErorrState(error.toString()));
      print(error.toString());
      });
  }
  IconData suffix =Icons.visibility_off_outlined;
  bool isPassword=true;

  void ChangePasswordVisibility()
  {
    isPassword=!isPassword;
    suffix=isPassword ? Icons.visibility_off_outlined :Icons.visibility_outlined;

    emit(ResturantRegisterChangePasswordVisibilitySuccessState());
  }
}