class Breed {
  final int? id;
  final String name;
  final String description;

  Breed({this.id, required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return {'id': id, "name": name, 'description': description};
  }

  factory Breed.fromMap(Map<String, dynamic> map) {
    return Breed(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? "",
        description: map['description'] ?? "");
  }

  @override
  String toString() => 'Breed(id: $id,name: $name, description: $description)';
}
