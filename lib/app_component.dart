import 'dart:async';
import 'package:angular/angular.dart';

import 'src/hero/hero_component.dart';
import 'src/hero/hero.dart';
import 'src/hero/hero_service.dart';

@Component(
  selector: 'toh-app',
  templateUrl: 'app_component.html',
  styleUrls: [ 'app_component.css' ],
  directives: [ coreDirectives, HeroComponent ],
  providers: [ ClassProvider(HeroService) ]
)
class AppComponent implements OnInit {

  String title = "Tour of Heroes";
  Hero selected;
  List<Hero> heroes;

  final HeroService _heroService;

  AppComponent(this._heroService);

  ngOnInit() => _getHeroes();

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAllSlowly();
  }

  void onSelect(Hero hero) => selected = hero;

}