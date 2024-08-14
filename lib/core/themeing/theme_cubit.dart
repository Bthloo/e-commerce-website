
import 'package:bn_website/core/themeing/theme_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
   bool? themeValue;
  static ThemeCubit get(context) => BlocProvider.of(context);
  changeTheme(ThemeStateEnum state)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch(state){
      case ThemeStateEnum.initial:
        if(sharedPreferences.getBool("theme") != null){
          if(sharedPreferences.getBool("theme") == true){
            themeValue = true;
            emit(ThemeLight());
          }else{
            themeValue = false;
            emit(ThemeDark());
          }
        }
        break;
      case ThemeStateEnum.light:
      sharedPreferences.setBool("theme", true);
      themeValue = true;
        emit(ThemeLight());
        break;
      case ThemeStateEnum.dark:
        sharedPreferences.setBool("theme", false);
        themeValue = false;
        emit(ThemeDark());
        break;
    }
  }
}
