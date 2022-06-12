


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/order_detailes_model.dart';
import 'package:untitled1/model/order_model.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/cubit/states.dart';
import 'package:untitled1/shared/conistant/constant.dart';
import 'package:untitled1/shared/conistant/end_points.dart';
import 'package:untitled1/shared/remote/dio_helper.dart';

class OrderCubit extends Cubit <orderState> {
  OrderCubit() : super(OrderInitialState());

//عشان اوبجيكت
  static OrderCubit get(context) => BlocProvider.of(context);
  OrderModel myOrder;
  void getMyOrderData() {
    emit(ResturantLoadingOrderDataStates());
    DioHelper.getdata(url: ORDER_HISTORY, token: token).then((value) {
      myOrder = OrderModel.fromJson(value.data);
      emit(ResturantSuccessOrderDataStates());
    }).catchError((error) {
      emit(ResturantErrorOrderDataStates());
      print(error.toString());
    });
  }
  //===============================================//
  OrderDetailesModel orderDetailesModel;

  void MyOrderDetailsData(String orderId) {
    emit(ResturantLoadingOrderDetailesStates());
    DioHelper.postdata(url: ORDER_DETAILS,data: {
      'order_id':orderId
    },token: token).then((value) {
      orderDetailesModel = OrderDetailesModel.fromJson(value.data);
      emit(ResturantSuccessOrderDetailesStates());
      print(value.data);
    }).catchError((error) {
      emit(ResturantErrorOrderDetailesStates());
      print(error.toString());
    });
  }

}