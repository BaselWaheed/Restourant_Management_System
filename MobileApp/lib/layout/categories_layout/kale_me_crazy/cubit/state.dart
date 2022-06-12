import 'package:untitled1/model/reservation_model.dart';

abstract class KaleCrazyState {}

class InitialCrazyState extends KaleCrazyState {}

class ChangeNavBarState extends KaleCrazyState {}

class ResturantReservationLoadingState extends KaleCrazyState {}

class ResturantReservationSuccessState extends KaleCrazyState {
  final ReservationModel reservationModel;

  ResturantReservationSuccessState(this.reservationModel);
}

class ResturantReservationErrorState extends KaleCrazyState {
  final Error;

  ResturantReservationErrorState(this.Error);
}
