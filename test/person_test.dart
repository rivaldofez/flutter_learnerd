import 'package:flutter/material.dart';
import 'package:flutter_learnerd/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  group("Mengecek Class Person", () {
    Person p;
    p = Person();

    test("Inisialisasi Objek Person", () {
      expect(p.name, equals("no name"));
      expect(p.age, equals(0));
    });

    test("Age Harus Positif", (){
      p.age = -5;
      expect(p.age, isPositive);
    });

    test("Angka keberuntungan harus 3 buah angka positif", (){
      expect(p.luckyNumbers, allOf([hasLength(equals(3)), isNot(anyElement(isNegative))]));
    });
  });

  setUp((){
    print("set up");
  });

  tearDown((){
    print("tear down");
  });
}
