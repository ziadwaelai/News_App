import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newes/componats/componats.dart';
import 'package:newes/cubit/cubit.dart';
import 'Screens/homeScreen.dart';
import 'cubit/api.dart';
import 'package:hexcolor/hexcolor.dart';

import 'cubit/appStatusCubit.dart';
import 'cubit/appcuibt.dart';

void main() {
  getData();
  print("lanched");
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getBusiness()
            ..getsport()
            ..getScience()..validat(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppCubitStatas>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.grey,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )),
            darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('333739'),
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.grey,
                      statusBarIconBrightness: Brightness.light),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20,
                    backgroundColor: HexColor('333739')),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
                textDirection: AppCubit.get(context).dirctions,
                child: HomeScreen()),
          );
        },
      ),
    );
  }
}
