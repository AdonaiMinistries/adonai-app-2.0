import 'package:adonai_2/bloc/sermons_event.dart';
import 'package:adonai_2/bloc/sermons_state.dart';
import 'package:adonai_2/services/https_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SermonsBloc extends Bloc<SermonsEvent, SermonsState> {
  final _dataService = DataService();

  SermonsBloc() : super(LoadingSermonsState());

  @override
  Stream<SermonsState> mapEventToState(SermonsEvent event) async* {
    if (event is LoadSermonsEvent) {
      /* Inital state is loading sermons. */
      yield LoadingSermonsState();
      try {
        final sermons = await _dataService.getSermons();
        yield LoadedSermonsState(sermons: sermons);
      } catch (e) {
        yield FailedToLoadSermonsState(error: e);
      }
    }
  }
}