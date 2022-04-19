// ignore_for_file: prefer_const_declarations

import 'package:sqlite_example/models/breed.dart';
import 'package:sqlite_example/services/database_service.dart';

final DatabaseService _databaseService = DatabaseService();

Future<void> _onBreedInsert() async {
  final name = 'German Shepherd';
  final description =
      'The German Shepherd is a breed of medium to large-sized working dog that originated in Germany.';
  await _databaseService
      .insertBreed(Breed(name: name, description: description));
}

Future<void> _onBreedUpdate(Breed breed) async {
  final name = breed.name;
  final description =
      "The German Shepherd Dog is one of America's most popular dog breeds";
  await _databaseService
      .updateBreed(Breed(id: breed.id!, description: description, name: name));
}

Future<void> _onBreedDelete(Breed breed) async {
  await _databaseService.deleteBreed(breed.id!);
}
