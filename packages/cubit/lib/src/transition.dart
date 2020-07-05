import 'package:meta/meta.dart';

/// {@template transition}
/// A [CubitTransition] represents the change from one [State] to another.
/// A [CubitTransition] consists of the [currentState] and [nextState].
/// {@endtemplate}
@immutable
class CubitTransition<State> {
  /// {@macro transition}
  const CubitTransition({
    @required this.currentState,
    @required this.nextState,
  });

  /// The current [State] at the time of the [CubitTransition].
  final State currentState;

  /// The next [State] at the time of the [CubitTransition].
  final State nextState;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CubitTransition<State> &&
          runtimeType == other.runtimeType &&
          currentState == other.currentState &&
          nextState == other.nextState;

  @override
  int get hashCode => currentState.hashCode ^ nextState.hashCode;

  @override
  String toString() {
    return '''CubitTransition { currentState: $currentState, nextState: $nextState }''';
  }
}
