import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/shared/Bloc/cubit.dart';
import 'package:news_app/shared/Bloc/states.dart';
import 'package:news_app/theme/Bloc/cubit.dart';


class SearchScreen extends StatelessWidget {

  var Searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context,NewsStates state)
      {

      },
      builder:  (BuildContext context,NewsStates state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                    style: Theme.of(context).textTheme.bodyText2,
                    validator: (value){
                      if(value.isEmpty)
                        return 'Search must be not empty';
                      return null;
                    },
                    onSaved:(value){
                      Searchcontroller = value as TextEditingController;
                    },
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    controller: Searchcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange,),
                        // borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: 'Search',
                      hintText: 'Search',
                      labelStyle: TextStyle(color: Colors.deepOrange),
                      prefixIcon: Icon(Icons.search, color: Colors.deepOrange,),
                      border: OutlineInputBorder(),
                    )

                ),
              ),
              Expanded(child: ConditionalBuilder(
                builder: (context) =>ListView.builder(

                  physics: BouncingScrollPhysics(),
                  itemBuilder:(context,index)=> buildArticleItem(list[index],context,),
                  itemCount: list.length,),
                condition:state is! NewsGetBusinessLoadingState,


              )),
            ],
          ),);
      },
    );

  }
}
