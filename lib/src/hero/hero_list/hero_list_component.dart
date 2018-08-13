import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:tour_of_heroes/src/hero/hero.dart';
import 'package:tour_of_heroes/src/hero/hero_service.dart';
import 'package:tour_of_heroes/route_paths.dart';

@Component(
  selector: 'toh-hero-list',
  templateUrl: 'hero_list_component.html',
  styleUrls: [ 'hero_list_component.css' ],
  directives: [ coreDirectives, routerDirectives ],
  pipes: [ commonPipes ],
)
class HeroListComponent implements OnInit {

  Hero selected;
  List<Hero> heroes;

  final HeroService _heroService;
  final Router router;

  HeroListComponent(this._heroService, this.router);

  @override
  void ngOnInit() async => _getHeroes();

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAllSlowly();
  }

  void onSelect(Hero hero) => selected = hero;

  String _heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> goToDetail() => router.navigate(_heroUrl(selected.id));

}