

import 'package:untitled1/model/change_favorites_model.dart';
import 'package:untitled1/model/change_password_model.dart';
import 'package:untitled1/model/check_out_in_model.dart';
import 'package:untitled1/model/order_model.dart';
import 'package:untitled1/model/reservation_model.dart';
import 'package:untitled1/model/send_review_model.dart';
import 'package:untitled1/model/user_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class CounterMinusState extends HomeState {
  final int counter;

  CounterMinusState(this.counter);
}

class CounterPlusState extends HomeState {
  final int counter;

  CounterPlusState(this.counter);
}

class ChangeColorCategories extends HomeState {}

class ChangeNavBarIconsState extends HomeState {}

class ResturantLoadingHomeDataStates extends HomeState {}

class ResturantSuccessHomeDataStates extends HomeState {}

class ResturantErrorHomeDataStates extends HomeState {}

class ResturantLoadingMeetDataStates extends HomeState {}

class ResturantSuccessMeetDataStates extends HomeState {}

class ResturantErrorMeetDataStates extends HomeState {}

class ResturantLoadingDrinksDataStates extends HomeState {}

class ResturantSuccessDrinksDataStates extends HomeState {}

class ResturantErrorDrinksDataStates extends HomeState {}

class ResturantLoadingChickenDataStates extends HomeState {}

class ResturantSuccessChickenDataStates extends HomeState {}

class ResturantErrorChickenDataStates extends HomeState {}

class ResturantLoadingVegetablesDataStates extends HomeState {}

class ResturantSuccessVegetablesDataStates extends HomeState {}

class ResturantErrorVegetablesDataStates extends HomeState {}

class ResturantChangeFavoritesState extends HomeState {}

class ResturantSuccessChangeFavoritesState extends HomeState {
  final ChangeFavoritesModel changeFavoritesModel;

  ResturantSuccessChangeFavoritesState(this.changeFavoritesModel);
}

class ResturantErrorChangeFavoritesState extends HomeState {}

class ResturantLoadingGetFavoritesState extends HomeState {}

class ResturantSuccessGetFavoritesState extends HomeState {}

class ResturantErrorGetFavoritesState extends HomeState {}

class ResturantLoadingUserDataState extends HomeState {}

class LoadingAccountInfoState extends HomeState {}

class SuccessAccountInfoState extends HomeState {
  final UserModel accountModel;

  SuccessAccountInfoState(this.accountModel);
}

class ErrorAccountInfoState extends HomeState {
  final String error;

  ErrorAccountInfoState(this.error);
}

class ChangeRadioState extends HomeState {}

class ResturantLoadingUpdateUserState extends HomeState {}

class ResturantSuccessUpdateUserState extends HomeState {
  final UserModel accountModel;

  ResturantSuccessUpdateUserState(this.accountModel);
}

class ResturantErrorUpdateUserState extends HomeState {}

class ResturantChangepasswordLoadingState extends HomeState {}

class ResturantChangepasswordSuccessState extends HomeState {
  final ChangePasswordModel changePasswordModel;

  ResturantChangepasswordSuccessState(this.changePasswordModel);
}

class ResturantChangepasswordErrorState extends HomeState {
  final String error;

  ResturantChangepasswordErrorState(this.error);
}

class ResturantChangepasswordCahngePasswordVisibilitySuccessState
    extends HomeState {}

class ResturantChangepasswordChangeChangeRadioState extends HomeState {}

class ResturantReviewLoadingState extends HomeState {}

class ResturantReviewSuccessState extends HomeState {
  final SendReview sendReview ;

  ResturantReviewSuccessState(this.sendReview);
}

class ResturantReviewErrorState extends HomeState {
  final String error;

  ResturantReviewErrorState(this.error);
}

class InitialGetProductsDetailsState extends HomeState {}

class LoadingGetProductsDetailsData extends HomeState {}

class SuccessGetProductsDetailsData extends HomeState {}

class ErrorGetProductsDetailsData extends HomeState {}

class CartLoadingState extends HomeState {}

class CartSuccessState extends HomeState {}

class CartErrorState extends HomeState {}

class CartAddLoadingState extends HomeState {}

class CartAddSuccessState extends HomeState {}

class CartAddErrorState extends HomeState {}

class CartRemoveLoadingState extends HomeState {}

class CartRemoveSuccessState extends HomeState {}

class CartRemoveErrorState extends HomeState {}

class CartLoadingUpdateQuantityState extends HomeState {}

class CartSuccessUpdateQuantityState extends HomeState {}

class CartErrorUpdateQuantityState extends HomeState {}

class ChangeNavBarState extends HomeState {}

class ResturantReservationLoadingState extends HomeState {}

class ResturantReservationSuccessState extends HomeState {
  final ReservationModel reservationModel;

  ResturantReservationSuccessState(this.reservationModel);
}

class ResturantReservationErrorState extends HomeState {
  final Error;

  ResturantReservationErrorState(this.Error);
}

class ResturantLoadingOrderDataStates extends HomeState {}

class ResturantSuccessOrderDataStates extends HomeState {
  final OrderModel orderModel;

  ResturantSuccessOrderDataStates(this.orderModel);
}

class ResturantErrorOrderDataStates extends HomeState {}

class ResturantLoadingCheckOutInStates extends HomeState {}

class ResturantSuccessCheckOutInStates extends HomeState {

  final CheckOutInModel checkOutIn;

  ResturantSuccessCheckOutInStates(this.checkOutIn);
}

class ResturantErrorCheckOutInStates extends HomeState {}
class LoadingReview extends HomeState{}

class SuccessReview extends HomeState{}

class ErrorReview extends HomeState{}

