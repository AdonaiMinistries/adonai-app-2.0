import 'package:adonai/bloc/sermons/sermons_event.dart';
import 'package:adonai/bloc/sermons/sermons_state.dart';
import 'package:adonai/services/https_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SermonsBloc extends Bloc<SermonsEvent, SermonsState> {
  final _dataService = DataService();

  SermonsBloc() : super(FetchingAppConfigState());

  Stream<SermonsState> mapEventToState(SermonsEvent event) async* {
    if (event is GetAppConfigEvent) {
      yield FetchingAppConfigState();
      try {
        /* Get the App Config from the server. */
        final appConfig = await _dataService.getFileFromServer();
        yield FetchedAppConfigState(appConfig: appConfig);
      } catch (e) {
        yield FailedToFetchState(error: e);
        throw (e);
      }
    }

    if (event is FetchSermonsEvent) {
      yield FetchingSermonsState();
      try {
        final sermons = await _dataService.getSermons(event.token);
        yield FetchedSermonsState(sermons: sermons);
      } catch (e) {
        yield FailedToFetchState(error: e);
        throw (e);
      }
    }
  }
}
