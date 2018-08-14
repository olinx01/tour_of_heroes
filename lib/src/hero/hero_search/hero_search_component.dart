import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:tour_of_heroes/route_paths.dart';
import 'package:tour_of_heroes/src/hero/hero.dart';
import 'package:tour_of_heroes/src/hero/hero_search/hero_search_service.dart';

@Component(
  selector: 'toh-hero-search',
  templateUrl: 'hero_search_component.html',
  styleUrls: [ 'hero_search_component.css' ],
  directives: [ coreDirectives ],
  providers: [ ClassProvider(HeroSearchService) ],
  pipes: [ commonPipes ]
)
class HeroSearchComponent implements OnInit {

  final HeroSearchService _heroSearchService;
  final Router _router;

  Stream<List<Hero>> heroes;
  StreamController<String> _searchTearms = StreamController<String>.broadcast();

  HeroSearchComponent(this._heroSearchService, this._router);

  void ngOnInit() async {
    heroes = _searchTearms.stream
      .transform(debounce(Duration(milliseconds: 300)))
      .distinct()
      .transform(
        switchMap((term) {
          return term.isEmpty
          ? Stream<List<Hero>>.fromIterable([<Hero>[]])
          : _heroSearchService.search(term).asStream();
        })
      ).handleError((e) {
        print(e); // for demo purposes only
      });
  }

  void search(String term) => _searchTearms.add(term);

  String _heroUrl(int id) => RoutePaths.hero.toUrl(parameters: { idParam: '$id' });

  Future<NavigationResult> goToDetail(int id) => _router.navigate(_heroUrl(id));

}