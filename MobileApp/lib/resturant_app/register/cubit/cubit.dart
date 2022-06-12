import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/user_model.dart';
import 'package:untitled1/resturant_app/register/cubit/states.dart';
import 'package:untitled1/shared/conistant/end_points.dart';
import 'package:untitled1/shared/remote/dio_helper.dart';

class ResturantRegisterCubit extends Cubit <ResturantRegisterStates>
{
  ResturantRegisterCubit():super(ResturantRegisterInitialState());

  static ResturantRegisterCubit get(context)=>BlocProvider.of(context);

  UserModel registerModel;

  void userRegister({
    @required String firstname,
    @required String lastname,
    @required String username,
    @required String email,
    @required String address,
    @required String password,
    // @required String password2,
    @required String phone,
    @required String birthdate,
    @required bool is_male,





  })
  {

    emit(ResturantRegisterLoadingState());
    DioHelper.postdata(
      url: REGISTER ,
      data: {
        'first_name':firstname,
        'last_name':lastname,
        'username':username,
        'email':email,
        'password':password,
        //'password2':password2,
        'phone':phone,
        'address':address,
        'birthdate':birthdate,
        'is_male':is_male
      },
    ).then((value)
    {
      registerModel= UserModel.fromJson(value.data);
      emit(ResturantRegisterSuccessState(registerModel));
    }).catchError((error)
    {
      emit(ResturantRegisterErrorState(error.toString()));
    });
  }
  bool male = false;
  int index=1;
  void Radio(value)
  {
    // male=!male;
    index=value;
    emit(ResturantRegisterChangeChangeRadioState());
  }

  IconData suffix =Icons.visibility_off_outlined;
  bool isPassword=true;

  void ChangePasswordVisibility()
  {
    isPassword=!isPassword;
    suffix=isPassword ? Icons.visibility_off_outlined :Icons.visibility_outlined;

    emit(ResturantRegisterCahngePasswordVisibilitySuccessState());
  }
}