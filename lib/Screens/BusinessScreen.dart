import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newes/componats/componats.dart';
import 'package:newes/cubit/appcuibt.dart';
import 'package:newes/cubit/cubit.dart';
import 'package:newes/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, NewsStates state) {},
      builder: (BuildContext context, NewsStates state) {
        return NewsCubit.get(context).validt == 'error'
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text("${NewsCubit.get(context).errore}",
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
              )
            : articleBuilder(NewsCubit.get(context).business);
      },
    );
  }
}
