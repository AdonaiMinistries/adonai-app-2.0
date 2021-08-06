import 'package:adonai/models/Sermon_config.dart';
import 'package:adonai/services/https_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SermonConfigCubit extends Cubit<SermonConfig> {
  final _dataService = DataService();

  SermonConfigCubit(SermonConfig initialState) : super(initialState);

  void getSermonsConfig(String id) async {
    final response = await _dataService.getSermonConfig(id);
    emit(response);
  }

  void clearSermonsConfig() => emit(null as SermonConfig);
}
