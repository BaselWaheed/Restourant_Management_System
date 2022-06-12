
import 'package:untitled1/model/login_model.dart';

abstract class ResturantLoginStates{}
class ResturantLoginInitialState extends ResturantLoginStates{}
class ResturantLoginLoadingState extends ResturantLoginStates{}
class ResturantLoginSuccessState extends ResturantLoginStates{
  final LoginModel loginModel;

  ResturantLoginSuccessState(this.loginModel);


}
class ResturantLoginErorrState extends ResturantLoginStates{
  final String error;

  ResturantLoginErorrState(this.error);


}
class ResturantRegisterChangePasswordVisibilitySuccessState extends ResturantLoginStates{}

