import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/hero/hero_service.dart';

import 'route_paths.dart';
import 'routes.dart';

@Component(
  selector: 'toh-app',
  templateUrl: 'app_component.html',
  styleUrls: [ 'app_component.css' ],
  directives: [ routerDirectives ],
  providers: [ ClassProvider(HeroService) ],
  exports: [ RoutePaths, Routes ]
)
class AppComponent {

  String title = "Tour of Heroes";

}