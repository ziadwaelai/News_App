import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appStatusCubit.dart';

class AppCubit extends Cubit<AppCubitStatas> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  var dirction = TextDirection.rtl;
  bool isDark = false;
  void changeAppMode() {
    isDark = !isDark;
    emit(AppModeState());
  }

  var dirctions = TextDirection.ltr;
  void textDirection(bool isEng) {
    if (isEng) {
      dirctions = TextDirection.rtl;
    } else {
      dirctions = TextDirection.ltr;
    }
    emit(AppLanguchState());
  }
}
