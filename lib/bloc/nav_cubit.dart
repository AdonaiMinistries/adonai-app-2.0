import 'package:adonai_2/bloc/sermon_config_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<String>{
  SermonConfigCubit sermonConfigCubit;

  NavCubit({required this.sermonConfigCubit}) : super(null as String);

  void showVideoScreen(String id){
    /* Get the sermon config. */
    sermonConfigCubit.getSermonsConfig(id);
    emit(id);
  }

  void popToHomeScreen(){
    emit(null as String);
    sermonConfigCubit.clearSermonsConfig();
  }
}