///
/// List of sermon events.
///
abstract class SermonsEvent {}

class GetAppConfigEvent extends SermonsEvent {}

class FetchSermonsEvent extends SermonsEvent {
  final String token;

  FetchSermonsEvent({required this.token});
}
