import 'package:cubit/cubit.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockCubit extends Mock implements Cubit<int> {}

// ignore: must_be_immutable
class MockCubitTransition extends Mock implements CubitTransition<int> {}

void main() {
  group('CubitObserver', () {
    group('onTransition', () {
      test('does nothing by default', () {
        CubitObserver().onTransition(MockCubit(), MockCubitTransition());
      });
    });
  });
}
