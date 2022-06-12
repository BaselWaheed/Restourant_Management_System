import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/Search_model.dart';
import 'package:untitled1/resturant_app/search/cubit/states.dart';
import 'package:untitled1/shared/conistant/constant.dart';
import 'package:untitled1/shared/conistant/end_points.dart';
import 'package:untitled1/shared/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel model;

  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postdata(url: SEARCH, token: token, data: {'dish_name': text})
        .then((value) {
      model = SearchModel.fromJson(value.data);
      print(text.toString());
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
