
import 'package:untitled1/model/forget_password_model.dart';

abstract class ResturantForgetpasswordStates {}

class ResturantForgetpasswordInitialState
    extends ResturantForgetpasswordStates {}

class ResturantForgetpasswordLoadingState
    extends ResturantForgetpasswordStates {}

class ResturantForgetpasswordSuccessState
    extends ResturantForgetpasswordStates {
  final ForgetPasswordModel forgetPassword;

  ResturantForgetpasswordSuccessState(this.forgetPassword);
}

class ResturantForgetpasswordErrorState extends ResturantForgetpasswordStates {
  final String error;

  ResturantForgetpasswordErrorState(this.error);
}
