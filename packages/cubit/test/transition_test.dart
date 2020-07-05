import 'package:meta/meta.dart';
import 'package:test/test.dart';
import 'package:cubit/cubit.dart';

@immutable
abstract class TransitionState {}

class SimpleTransitionState extends TransitionState {}

class CounterState extends TransitionState {
  CounterState(this.count);

  final int count;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterState &&
          runtimeType == other.runtimeType &&
          count == other.count;

  @override
  int get hashCode => count.hashCode;
}

void main() {
  group('Transition', () {
    group('== operator', () {
      test('should return true if transitions are equal', () {
        final transitionA = CubitTransition<CounterState>(
          currentState: CounterState(0),
          nextState: CounterState(1),
        );
        final transitionB = CubitTransition<CounterState>(
          currentState: CounterState(0),
          nextState: CounterState(1),
        );

        expect(transitionA == transitionB, isTrue);
      });

      test('should return false if transitions are not equal', () {
        final transitionA = CubitTransition<CounterState>(
          currentState: CounterState(0),
          nextState: CounterState(1),
        );
        final transitionB = CubitTransition<CounterState>(
          currentState: CounterState(1),
          nextState: CounterState(0),
        );

        expect(transitionA == transitionB, isFalse);
      });
    });

    group('hashCode', () {
      test('should be correct', () {
        final transition = CubitTransition<CounterState>(
          currentState: CounterState(0),
          nextState: CounterState(1),
        );
        expect(
          transition.hashCode,
          transition.currentState.hashCode ^ transition.nextState.hashCode,
        );
      });
    });

    group('toString', () {
      test('should return correct string representation', () {
        final transition = CubitTransition<CounterState>(
          currentState: CounterState(0),
          nextState: CounterState(1),
        );

        expect(
          transition.toString(),
          '''CubitTransition { currentState: ${transition.currentState}, nextState: ${transition.nextState} }''',
        );
      });
    });
  });
}
