import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../hero.dart';
import 'package:tour_of_heroes/src/hero/hero_service.dart';
import 'package:tour_of_heroes/route_paths.dart';

@Component(
  selector: 'toh-hero-detail',
  templateUrl: 'hero_detail_component.html',
  styleUrls: [ 'hero_detail_component.css' ],
  directives: [ coreDirectives, formDirectives ]
)
class HeroDetailComponent implements OnActivate {

  Hero hero;
  final HeroService _heroService;
  final Location _location;

  HeroDetailComponent(this._heroService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) hero = await (_heroService.get(id));
  }

  int getId(Map<String, String> parameters) {
    final id = parameters[idParam];
    return (id == null ? null : int.tryParse(id));
  }

  void goBack() => _location.back();

  Future<void> save() async {
    _heroService.update(hero);
    goBack();
  }

}