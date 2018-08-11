import 'dart:async';
import 'hero.dart';
import 'mock_heroes.dart';

class HeroService {

  Future<Hero> get(int id) async => (await getAllSlowly()).firstWhere((hero) => hero.id == id);

  Future<List<Hero>> getAll() async => mockHeroes;
  Future<List<Hero>> getAllSlowly() async => Future.delayed(Duration(seconds: 1), getAll);

}