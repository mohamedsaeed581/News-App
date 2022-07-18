import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:news_app/shared/Bloc/cubit.dart';
import 'package:news_app/shared/Bloc/states.dart';
import 'package:news_app/theme/Bloc/cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, Object state) {  },

      builder: (BuildContext context, state) {

        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: (){AppCubit.get(context).changeAppMode();}, icon: Icon(Icons.brightness_6_outlined)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){

                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems ),
          body: cubit.screens[cubit.currentIndex],

        );
      },
    );
  }
}
