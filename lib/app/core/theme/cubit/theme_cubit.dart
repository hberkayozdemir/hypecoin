import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool _isDarkMode= false;
  bool get isDarkMode=> _isDarkMode;

  void changeTheme(){
    _isDarkMode=!_isDarkMode;


    emit(ThemeChanged());
  }

}
