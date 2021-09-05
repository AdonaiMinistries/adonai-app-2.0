import 'package:adonai/models/App_config.dart';
import 'package:adonai/models/Sermons.dart';

///
/// List of sermon state.
///
abstract class SermonsState {}

class FailedToFetchState extends SermonsState {
  Object error;

  FailedToFetchState({required this.error});
}

class FetchingAppConfigState extends SermonsState {}

class FetchedAppConfigState extends SermonsState {
  AppConfig appConfig;

  FetchedAppConfigState({required this.appConfig});
}

class FetchingSermonsState extends SermonsState {}

class FetchedSermonsState extends SermonsState {
  List<Sermon> sermons;

  FetchedSermonsState({required this.sermons});
}
