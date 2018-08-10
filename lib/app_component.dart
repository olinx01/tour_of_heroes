import 'package:angular/angular.dart';

import 'src/hero/hero_component.dart';
import 'src/hero/hero.dart';
import 'src/hero/mock_heroes.dart';

@Component(
  selector: 'toh-app',
  templateUrl: 'app_component.html',
  styleUrls: [ 'app_component.css' ],
  directives: [ coreDirectives, HeroComponent ]
)
class AppComponent {

  String title = "Tour of Heroes";

  List<Hero> heroes = mock_heroes;

  Hero selected;

  void onSelect(Hero hero) => this.selected = hero;

}