import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newes/componats/componats.dart';
import 'package:newes/cubit/cubit.dart';
import 'package:newes/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value) {
                    if (!value.isEmpty) {
                      NewsCubit.get(context).getSearch(value);
                    } else {
                      return 'search must not be empty';
                    }
                  },
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(
                child: NewsCubit.get(context).validt == 'error'
                    ? Center(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${NewsCubit.get(context).errore}" ,
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                        ),
                      )
                    : articleBuilder(
                        list,
                        isSerach: true,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
