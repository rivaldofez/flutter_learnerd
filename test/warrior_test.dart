import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_learnerd/warrior.dart';

class MockWarrior extends Mock implements Warrior {}

void main() {
  MockWarrior warrior = MockWarrior();
  Warrior w = Warrior();

  test("Verify Demo", () {
    warrior.rest();
    warrior.training();
    // verify(warrior.rest()).called(2);
    verifyInOrder([warrior.rest(), warrior.training()]);
  });

  test("Null Demo", () {
    expect(warrior.name, isNull);
  });

  test("then return demo", () {
    when(warrior.name).thenReturn("no name");
    expect(warrior.name, equals("no name"));
  });

  test("then throw demo", () {
    when(warrior.rest()).thenThrow(Exception("Cant Sleep"));
    expect(() => warrior.rest(), throwsException);
  });

  test("then answer demo", () async {
    when(warrior.training()).thenAnswer((_) => Future.value(true));
    bool result = await warrior.training();
    expect(result, equals(true));
  });
}
