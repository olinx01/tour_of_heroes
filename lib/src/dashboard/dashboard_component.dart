import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:tour_of_heroes/route_paths.dart';
import 'package:tour_of_heroes/src/hero/hero.dart';
import 'package:tour_of_heroes/src/hero/hero_service.dart';
import 'package:tour_of_heroes/src/hero/hero_search/hero_search_component.dart';

@Component(
  selector: 'toh-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: [ 'dashboard_component.css' ],
  directives: [ coreDirectives, routerDirectives, HeroSearchComponent ],
)
class DashboardComponent implements OnInit {

  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }

  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

}