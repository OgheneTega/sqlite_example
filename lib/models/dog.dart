import 'package:flutter/cupertino.dart';

class Dog {
  final int? id;
  final String name;
  final int age;
  final Color color;
  final int breedId;

  Dog(
      {this.id,
      required this.name,
      required this.age,
      required this.breedId,
      required this.color});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "name": name,
      'age': age,
      'color': color.value,
      'breedId': breedId
    };
  }

  fromMap(Map<String, dynamic> map) {
    return Dog(
        id: map['id']?.toInt() ?? 0,
        age: map['age']?.toInt() ?? 0,
        name: map['name'] ?? "",
        color: Color(map['color']),
        breedId: map['breedId']?.toInt() ?? 0);
  }

  @override
  String toString() {
    return 'Dog(id: $id,name: $name, age: $age, color:$color, breedId: $breedId)';
  }
}
