import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newes/Screens/search.dart';
import 'package:newes/componats/componats.dart';
import 'package:newes/cubit/appcuibt.dart';
import 'package:newes/cubit/cubit.dart';
import 'package:newes/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, NewsStates state) {},
        builder: (BuildContext context, NewsStates state) {
          NewsCubit cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text("${cubit.title}"),
              actions: [
                GestureDetector(
                  onTap: () {
                    NewsCubit.get(context)
                        .languch(NewsCubit.get(context).isEnglsh);
                    AppCubit.get(context)
                        .textDirection(NewsCubit.get(context).isEnglsh);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 40,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('${cubit.url}'),
                              fit: BoxFit.contain)),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.brightness_2_sharp),
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                ),
              ],
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItem,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.bottomNav(index);
              },
            ),
          );
        });
  }
}

