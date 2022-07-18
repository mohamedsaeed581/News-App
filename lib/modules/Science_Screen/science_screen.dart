import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/shared/Bloc/cubit.dart';
import 'package:news_app/shared/Bloc/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state){
        var list = NewsCubit.get(context).science;
        return ConditionalBuilder(
          condition: list.length >0,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleItem(list[index],context) , separatorBuilder: (context,index) => SizedBox(height: 3,), itemCount: list.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      } ,

    );
  }
}
