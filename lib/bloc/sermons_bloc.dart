import 'package:adonai/bloc/sermons_event.dart';
import 'package:adonai/bloc/sermons_state.dart';
import 'package:adonai/bloc/sermons_event.dart';
import 'package:adonai/bloc/sermons_state.dart';
import 'package:adonai/services/https_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SermonsBloc extends Bloc<SermonsEvent, SermonsState> {
  final _dataService = DataService();

  SermonsBloc() : super(LoadingAppConfigState());

  @override
  Stream<SermonsState> mapEventToState(SermonsEvent event) async* {
    if (event is GetAppConfigEvent) {
      yield LoadingAppConfigState();
      try {
        final appConfig = await _dataService.getFileFromServer();
        yield LoadedAppConfigState(appConfig: appConfig);

        final sermons = await _dataService.getSermons(appConfig.config.token);
        yield LoadedSermonsState(sermons: sermons);
      } catch (e) {
        throw e;
      }
    }
  }
}
