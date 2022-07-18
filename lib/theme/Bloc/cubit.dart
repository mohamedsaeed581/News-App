import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/cacheHelper.dart';
import 'package:news_app/theme/Bloc/states.dart';



class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialAppState());
  static  AppCubit get(context) => BlocProvider.of(context);

  bool isDark=false;
  void changeAppMode({bool fromShared}){
    //
    // isDark = !isDark;
    // CacheHelper.putBoolen(key: 'isDark', value: isDark).then((value) {
    //   emit(AppChangeModeState());
    // });

    if(fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else {
      isDark = !isDark;
      CacheHelper.putBoolen(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }




}
