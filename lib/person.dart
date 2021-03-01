import 'package:equatable/equatable.dart';

class Person extends Equatable{
  final String name;
  final int age;
  final int id;

  Person({this.age, this.name, this.id});

  factory Person.fromJson(Map<String,dynamic> json){
    return Person(
      id: json['id'],
      name: json['name'],
      age: json['age']
    );
  }

  @override
  List<Object> get props => [id,name,age];
}