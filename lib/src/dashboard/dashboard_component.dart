import 'package:angular/angular.dart';

import 'package:tour_of_heroes/src/hero/hero.dart';
import 'package:tour_of_heroes/src/hero/hero_service.dart';

@Component(
  selector: 'toh-dashboard',
  templateUrl: 'dashboard_component.html',
  directives: [ coreDirectives ],
)
class DashboardComponent implements OnInit {

  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAllSlowly()).skip(1).take(4).toList();
  }

}