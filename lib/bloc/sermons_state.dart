import 'package:adonai_2/models/Sermons.dart';

///
/// List of sermon state.
///
abstract class SermonsState {}

class LoadingSermonsState extends SermonsState {}

class LoadedSermonsState extends SermonsState {
  List<Sermon> sermons;

  LoadedSermonsState({required this.sermons});
}

class FailedToLoadSermonsState extends SermonsState {
  Object error;

  FailedToLoadSermonsState({required this.error});
}