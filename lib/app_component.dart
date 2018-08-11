import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/hero/hero_list/hero_list_component.dart';
import 'src/hero/hero_service.dart';

@Component(
  selector: 'toh-app',
  templateUrl: 'app_component.html',
  styleUrls: [ 'app_component.css' ],
  directives: [ HeroListComponent ],
  providers: [ ClassProvider(HeroService) ]
)
class AppComponent {

  String title = "Tour of Heroes";

}