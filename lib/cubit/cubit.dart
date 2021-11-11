import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newes/Screens/BusinessScreen.dart';
import 'package:newes/Screens/ScienceScreen.dart';
import 'package:newes/Screens/SportsScreen.dart';
import 'package:newes/cubit/states.dart';
import 'api.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool isEnglsh = true;
  String country = 'us';
  String url = 'image/us.jpg';
  bool isloding = true;
  String errore =
      'You have made too many requests recently. Developer accounts are limited to 100 requests over a 24 hour period (50 requests available every 12 hours). Please upgrade to a paid plan if you need more requests';
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  List<Widget> screen = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void bottomNav(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sport = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    getData(
      category: 'business',
      country: '$country',
    ).then((value) {
      business = value['articles'];
      // print(business);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getsport() {
    emit(NewsGetSportLoadingState());

    getData(
      category: 'sport',
      country: '$country',
    ).then((value) {
      sport = value['articles'];
      // print(business);

      emit(NewsGetSportSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportErrorState(error.toString()));
    });
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());

    getData(
      category: 'science',
      country: '$country',
    ).then((value) {
      science = value['articles'];
      // print(business);

      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  String validt;
  void validat() {
    getData(
      category: 'science',
      country: '$country',
    ).then((value) {
      validt = value['status'];

      emit(NewsvalidtSuccessState());
    });
  }

  String title = "News";

  void languch(bool isEng) {
    if (isEng) {
      country = 'us';
      isEnglsh = false;
      url = 'image/us.jpg';
      title = "News";
      errore =
          'You have made too many requests recently. Developer accounts are limited to 100 requests over a 24 hour period (50 requests available every 12 hours). Please upgrade to a paid plan if you need more requests';
    } else {
      country = 'eg';
      isEnglsh = true;
      url = 'image/eg.png';
      title = "الاخبار";
      errore =
          'لقد قدمت طلبات كثيرة جدًا مؤخرًا. تقتصر حسابات المطورين على 100 طلب خلال فترة 24 ساعة (يتوفر 50 طلبًا كل 12 ساعة). يرجى الترقية إلى خطة مدفوعة إذا كنت بحاجة إلى المزيد من الطلبات';
    }
    // print("validt:$validt");
    getBusiness();
    getScience();
    getsport();
  }

  void getSearch(String value) {
    emit(NewsGetsearcheLoadingState());
    getdataserch(key: '$value').then((value) {
      search = value['articles'];
      // print(business);

      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetsearchErrorState(error.toString()));
    });
  }

  void webReloade() {
    isloding = false;
    emit(WebReloadeState());
  }
}
