import 'dart:async';
import 'package:angular/angular.dart';

import '../hero.dart';
import '../hero_service.dart';

@Component(
  selector: 'toh-hero-list',
  templateUrl: 'hero_list_component.html',
  styleUrls: [ 'hero_list_component.css' ],
  directives: [ coreDirectives ]
)
class HeroListComponent implements OnInit {

  Hero selected;
  List<Hero> heroes;

  final HeroService _heroService;

  HeroListComponent(this._heroService);

  @override
  void ngOnInit() async => _getHeroes();

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAllSlowly();
  }

  void onSelect(Hero hero) => selected = hero;

}