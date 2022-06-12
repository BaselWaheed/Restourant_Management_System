import 'package:untitled1/model/user_model.dart';

abstract class ResturantRegisterStates {}

class ResturantRegisterInitialState extends ResturantRegisterStates {}

class ResturantRegisterLoadingState extends ResturantRegisterStates {}

class ResturantRegisterSuccessState extends ResturantRegisterStates {
  final UserModel  registerModel;

  ResturantRegisterSuccessState(this. registerModel);
}

class ResturantRegisterErrorState extends ResturantRegisterStates {
  final String error;

  ResturantRegisterErrorState(this.error);
}

class ResturantRegisterCahngePasswordVisibilitySuccessState
    extends ResturantRegisterStates {}

class ResturantRegisterChangeChangeRadioState extends ResturantRegisterStates {}
